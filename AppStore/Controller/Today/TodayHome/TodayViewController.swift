//
//  TodayViewController.swift
//  AppStore
//
//  Created by KH on 25/06/2022.
//

import UIKit

class TodayViewController: BaseViewController {
    
    // MARK: -- Properties
    var items = [TodayItem]()
    var startingFrame: CGRect?
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    var appFullScreenController: AppFullScreenViewController?
    var appGroup1: AppGroup?
    var appGroup2: AppGroup?
    
    let activityIndicator: UIActivityIndicatorView = {
        let ac = UIActivityIndicatorView()
        ac.startAnimating()
        ac.hidesWhenStopped = true
        ac.style = .large
        
        return ac
    }()
    
    // MARK: -- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        navigationController?.isNavigationBarHidden = true
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayItem.TypeName.single.rawValue)
        collectionView.register(MultipleCollectionViewCell.self, forCellWithReuseIdentifier: TodayItem.TypeName.multiple.rawValue)
        collectionView.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9411764706, blue: 0.9725490196, alpha: 1)
        configureActivity()
    }
    
    // Configure Activity Indicator
    func configureActivity() {
        view.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
    }
    
    fileprivate func fetchData() {
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchFreeGames { (appGroup, error) in
            dispatchGroup.leave()
            self.appGroup1 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchPaidGames {(appGroup, error) in
            dispatchGroup.leave()
            self.appGroup2 = appGroup
        }
        
        
        dispatchGroup.notify(queue: .main) {
            self.activityIndicator.stopAnimating()
            self.items = [
                TodayItem.init(category: "", title: self.appGroup1?.feed.title ?? "", image: UIImage(), description: "", backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), typeName: .multiple, apps: self.appGroup1?.feed.results ?? []),
                
                TodayItem.init(category: "Life Hack", title: "Utilize your Time", image: #imageLiteral(resourceName: "garden2"), description: "Thanks to the way classes work, we can modify this object even though it’s declared as a constant using it", backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), typeName: .single, apps: []),
                
                TodayItem.init(category: "", title: self.appGroup2?.feed.title ?? "", image: UIImage(), description: "", backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), typeName: .multiple, apps: self.appGroup2?.feed.results ?? [])
            ]
            self.collectionView.reloadData()
        }
    }
}


// MARK: -- Extension DataSource And Delegate
extension TodayViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = items[indexPath.item].typeName.rawValue
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BaseTodayCell
        cell.todayItem = items[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: Idetidiers.sizeOfCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    // MARK: -- DidSelectRow
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if items[indexPath.item].typeName == .multiple {
            let fullScreenController = TodayMultipleApssViewController(mode: .fullScreen)
            fullScreenController.apps = items[indexPath.item].apps
            fullScreenController.modalPresentationStyle = .fullScreen
            present(fullScreenController, animated: true)
            return
        }
        
        let appFullScreenController = AppFullScreenViewController()
        appFullScreenController.todayItem = items[indexPath.row]
        collectionView.isUserInteractionEnabled = false
        let redView = appFullScreenController.view!
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCloseRedView)))
        redView.layer.cornerRadius = 16
        view.addSubview(redView)
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        
        self.appFullScreenController = appFullScreenController
        addChild(appFullScreenController)
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = redView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = redView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        
        self.view.layoutIfNeeded()
        self.setTabBarHidden(true)
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn) {
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
            
            guard let cell = appFullScreenController.tableView.cellForRow(at: [0,0]) as? TodayHeaderCell else { return }
            cell.todayCell.topConstraint?.constant = 48
            cell.layoutIfNeeded()
        }
    }
    
    // MARK: -- Handle UITapGestureRecognizer When Tapping on screen
    @objc func handleCloseRedView(gesture: UITapGestureRecognizer) {
        self.view.layoutIfNeeded()
        
        self.setTabBarHidden(false)
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn) {
            
            self.appFullScreenController?.tableView.scrollToRow(at: [0,0], at: .top, animated: true)
            guard let startingFrame = self.startingFrame else { return }
            
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            self.view.layoutIfNeeded()
            
            guard let cell = self.appFullScreenController?.tableView.cellForRow(at: [0,0]) as? TodayHeaderCell else { return }
            cell.todayCell.topConstraint?.constant = 24
            cell.layoutIfNeeded()
            
        } completion: { _ in
            gesture.view?.removeFromSuperview()
            self.appFullScreenController?.removeFromParent()
            self.collectionView.isUserInteractionEnabled = true
        }
    }
}
