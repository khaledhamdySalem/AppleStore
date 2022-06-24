//
//  TodayControllerViewController.swift
//  AppStore
//
//  Created by KH on 21/06/2022.
//

import UIKit

class TodayController: BaseViewController {
    
    // MARK: -- Properties
    let activityIndicator: UIActivityIndicatorView = {
        let ac = UIActivityIndicatorView(style: .large)
        ac.startAnimating()
        ac.hidesWhenStopped = true
        ac.color = .black
        return ac
    }()
    
    var startingFrame: CGRect?
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstarint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    var appFullScreenController: AppFullScreenController?
    var results = [FeedResults]()
    var items = [TodayItem]()
    
    // MARK: -- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureActivityIndicator()
        collectionView.backgroundColor = #colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayItem.CellType.single.rawValue)
        collectionView.register(TodayMultipleCell.self, forCellWithReuseIdentifier: TodayItem.CellType.multiple.rawValue)
        navigationController?.isNavigationBarHidden = true
        fetchData()
    }
    
    var freeGamesGroup: AppGroup?
    var paidGamesGroup: AppGroup?
    
    fileprivate func fetchData() {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchFreeGames {[weak self] (appGroup, error) in
            self?.freeGamesGroup = appGroup
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        Service.shared.fetchPaidGames {[weak self] (appGroup, error) in
            self?.paidGamesGroup = appGroup
            dispatchGroup.leave()
            
        }
        
        dispatchGroup.notify(queue: .main) {
            
            self.activityIndicator.stopAnimating()
            self.collectionView.reloadData()
            
            //freeGamesGroup?.feed.results
            
            self.items = [
                TodayItem.init(category: "Free Games", title: self.freeGamesGroup?.feed.title ?? "", image: UIImage(), description: "", backgroundColor: #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1), cellType: .multiple, app: self.freeGamesGroup?.feed.results ?? []),
                
                TodayItem.init(category: "Paid Games", title: self.paidGamesGroup?.feed.title ?? "", image: UIImage(), description: "", backgroundColor: #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1), cellType: .multiple, app: self.paidGamesGroup?.feed.results ?? []),
                
                TodayItem.init(category: "Holidays", title: "Travel on a Budget", image: #imageLiteral(resourceName: "garden1"), description: "All the tools and apps you need to intelligently organize your life the right way", backgroundColor: #colorLiteral(red: 0.9785991311, green: 0.9592527747, blue: 0.7233415246, alpha: 1), cellType: .single, app: [])
            ]
        }
    }
    
    fileprivate func configureActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
    }
}

// MARK: -- DataSourse & Delegate & UICollectionViewDelegateFlowLayout
extension TodayController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellID = items[indexPath.item].cellType.rawValue
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        if let cell = cell as? BaseTodayCell {
            cell.todayItem = items[indexPath.item]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: Idetidiers.sizeOfCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}

// MARK: -- DidSelect
extension TodayController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if items[indexPath.item].cellType == .multiple  {
            let fullController = TodayMultipleApssController(mode: .fullScreen)
            fullController.results = items[indexPath.item].app
            fullController.modalPresentationStyle = .fullScreen
            self.present(fullController, animated: true)
            return
        }
        
        // // // // // // // // //☑️ 1
        let appFullScreenController = AppFullScreenController()
        appFullScreenController.dismissHandler = {
            self.handleRemoveRedView(gesture: .init())
        }
        appFullScreenController.todayItem = items[indexPath.item]
        self.appFullScreenController = appFullScreenController
        addChild(appFullScreenController)
        
        // // // // // // // // //☑️ 2
        let fullScreenView = appFullScreenController.view!
        view.addSubview(fullScreenView)
        fullScreenView.layer.cornerRadius = 16
        fullScreenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView)))
        fullScreenView.translatesAutoresizingMaskIntoConstraints = false
        
        // // // // // // // // //☑️ 3
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        
        // // // // // // // // //☑️ 4
        topConstraint = fullScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = fullScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstarint = fullScreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = fullScreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        [topConstraint, leadingConstraint, widthConstarint, heightConstraint].forEach({$0?.isActive = true})
        
        // // // // // // // // //☑️ 5
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstarint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
            self.setTabBarHidden(true)
        }
    }
    
    @objc func handleRemoveRedView(gesture: UITapGestureRecognizer) {
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
            self.appFullScreenController?.tableView.scrollToRow(at: [0,0], at: .top, animated: true)
            
            guard let staringFrame = self.startingFrame else { return }
            self.topConstraint?.constant = staringFrame.origin.y
            self.leadingConstraint?.constant = staringFrame.origin.x
            self.widthConstarint?.constant = staringFrame.width
            self.heightConstraint?.constant = staringFrame.height
            self.view.layoutIfNeeded()
            self.setTabBarHidden(false)
        } completion: { _ in
            gesture.view?.removeFromSuperview()
        }
    }
    
    //    func handleRemove() {
    //
    //        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
    //
    //            self.appFullScreenController?.tableView.scrollToRow(at: [0,0], at: .top, animated: true)
    //
    //            guard let staringFrame = self.startingFrame else { return }
    //
    //            self.topConstraint?.constant = staringFrame.origin.y
    //            self.leadingConstraint?.constant = staringFrame.origin.x
    //            self.widthConstarint?.constant = staringFrame.width
    //            self.heightConstraint?.constant = staringFrame.height
    //
    //            self.view.layoutIfNeeded()
    //
    //            self.setTabBarHidden(false)
    //
    //
    //        } completion: { _ in
    ////            gesture.view?.removeFromSuperview()
    //            self.appFullScreenController?.view.removeFromSuperview()
    //            self.appFullScreenController?.removeFromParent()
    //        }
    //    }
}
