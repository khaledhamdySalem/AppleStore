//
//  TodayController.swift
//  AppStore
//
//  Created by KH on 01/07/2022.
//

import UIKit

class TodayController: BaseViewController {
    
    // MARK: -- NSLayoutConstraint
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    var startingFrame: CGRect?
    
    // MARK: -- Fetch Data Properties
    var appFullScreenController  = AppFullScreenController()
    var freeGameGroup: AppGroup?
    var paidGameGroup: AppGroup?
    var items = [TodayItem]()
    
    // MARK: -- Indicator
    let activityIndicator: UIActivityIndicatorView = {
        let ac = UIActivityIndicatorView()
        ac.startAnimating()
        ac.style = .large
        return ac
    }()
    
    // MARK: -- DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        configureCollectionView()
        configureActivityIndicator()
        fetchData()
    }
    
    // MARK: -- Configure CollectionView
    fileprivate func configureCollectionView() {
        collectionView.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9411764706, blue: 0.9725490196, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayItem.CellType.single.rawValue)
        collectionView.register(TodayMultipleAppCell.self, forCellWithReuseIdentifier: TodayItem.CellType.multiple.rawValue)
    }
    
    // MARK: -- Configure ActivityIndicator
    fileprivate func configureActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
    }
    
    // MARK: -- FetchData
    fileprivate func fetchData() {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        Service.shared.fetchFreeGames{(appResult, error) in
            dispatchGroup.leave()
            self.freeGameGroup = appResult
        }
        
        dispatchGroup.enter()
        Service.shared.fetchPaidGames{(appResult, error) in
            dispatchGroup.leave()
            self.paidGameGroup = appResult
        }
        
        dispatchGroup.notify(queue: .main) {
            self.activityIndicator.stopAnimating()
            self.items = [
                TodayItem.init(category: "Daily List", title: self.freeGameGroup?.feed.title ?? "", image: UIImage(), description: "", backgroundColor: #colorLiteral(red: 0.9450980392, green: 0.9411764706, blue: 0.9725490196, alpha: 1), cellType: .multiple, apps: self.freeGameGroup?.feed.results ?? []),
                
                TodayItem.init(category: "Daily List", title: self.paidGameGroup?.feed.title ?? "", image: UIImage(), description: "", backgroundColor: #colorLiteral(red: 0.9450980392, green: 0.9411764706, blue: 0.9725490196, alpha: 1), cellType: .multiple, apps: self.paidGameGroup?.feed.results ?? []),
                
                TodayItem.init(category: "LIFE HACK", title: "Utilize Your Time", image: #imageLiteral(resourceName: "garden2"), description: "All the tools All the tools All the tools All the tools All the tools All the tools All the tools All the tools All the tools", backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cellType: .single, apps: [])
            ]
            self.collectionView.reloadData()
        }
    }
}


// MARK: -- Did SelectItemAt
extension TodayController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if items[indexPath.item].cellType == .multiple { 
            let fullcontroller = TodayMultipleAppsController(mode: .fullScreen)
            fullcontroller.appResults = self.items[indexPath.item].apps
            let nav = BackEnableNavController(rootViewController: fullcontroller)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            return
        }
        
        let appFullScreenController  = AppFullScreenController()
        appFullScreenController.todayItem = items[indexPath.row]
        let fullscreenView = appFullScreenController.view!
        fullscreenView.layer.cornerRadius = 16
        fullscreenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCloseRedView)))
        view.addSubview(fullscreenView)
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        
        fullscreenView.translatesAutoresizingMaskIntoConstraints = false
        topConstraint = fullscreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = fullscreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = fullscreenView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = fullscreenView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        
        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        
        addChild(appFullScreenController)
        self.appFullScreenController = appFullScreenController
        
        self.collectionView.isUserInteractionEnabled = false
        
        setTabBarHidden(true)
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn) {
            fullscreenView.frame = self.view.frame
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
            self.handleConstraintForheaderCellInDetailsScreen(constant: 48)
        }
    }
    
    // MARK: -- Handle Cancle
    @objc fileprivate func handleCloseRedView(gesture: UITapGestureRecognizer) {
        setTabBarHidden(false)
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn) {
            
            self.appFullScreenController.tableView.scrollToRow(at: [0,0], at: .top, animated: true)
            
            guard let startingFrame = self.startingFrame else { return }
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            self.view.layoutIfNeeded()
            self.handleConstraintForheaderCellInDetailsScreen(constant: 24)
            
        } completion: { _ in
            gesture.view?.removeFromSuperview()
            self.appFullScreenController.removeFromParent()
            self.collectionView.isUserInteractionEnabled = true
        }
    }
    
    // MARK: -- HandleConstraintForheaderCellInDetailsScreen
    fileprivate func handleConstraintForheaderCellInDetailsScreen(constant: CGFloat) {
        guard let cell = self.appFullScreenController.tableView.cellForRow(at: [0,0]) as? AppFullScreenHeaderCell else { return }
        cell.headerCell.topConstraint?.constant = constant
        cell.layoutIfNeeded()
    }
}

// MARK: -- DataSource - Delegate - DelegateFlowLayout
extension TodayController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = items[indexPath.item].cellType.rawValue
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BaseTodayCell
        cell.todayItem = items[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: Idetidiers.sizeOfCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
