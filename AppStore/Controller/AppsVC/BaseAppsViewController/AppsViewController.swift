//
//  AppsViewController.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit
import Combine
class AppsViewController: UIViewController {
    
    // MARK: -- Properties
    var groups = [AppGroup]()
    var socialApps = [SocialHeaderResponse]()
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let ac = UIActivityIndicatorView(style: .large)
        ac.startAnimating()
        ac.hidesWhenStopped = true
        ac.color = .black
        return ac
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCollectionView()
        fetchFreeGames()
        configureActivityIndicator()
    }
   
    let dispatchGroup = DispatchGroup()
    var group1: AppGroup?
    var group2: AppGroup?
    var group3: AppGroup?
    
    // MARK: -- Fetching Data ✔️
    fileprivate func fetchFreeGames() {
        dispatchGroup.enter()
        Service.shared.fetchFreeGames {[weak self] appGroup, error in
            guard let self = self else { return }
            self.dispatchGroup.leave()
            guard let group = appGroup else { return }
            self.group1 = group
        }
        
        dispatchGroup.enter()
        Service.shared.fetchPaidGames {[weak self] appGroup, error in
            guard let self = self else { return }
            self.dispatchGroup.leave()
            guard let group = appGroup else { return }
            self.group2 = group
        }
        
        dispatchGroup.enter()
        Service.shared.fetchAppGroup(urlString: "https://rss.applemarketingtools.com/api/v2/us/books/top-free/50/books.json") {[weak self] appGroup, error in
            guard let self = self else { return }
            self.dispatchGroup.leave()
            guard let group = appGroup else { return }
            self.group3 = group
        }
        
        Service.shared.fetchSocialApps {[weak self] socialApps, error in
            guard let self = self, let socialApps = socialApps else { return }
            self.socialApps = socialApps
        }
        
        dispatchGroup.notify(queue: .main) {
            self.activityIndicator.stopAnimating()
            guard let group1 = self.group1, let group2 = self.group2, let group3 = self.group3 else { return }
            self.groups.append(group1)
            self.groups.append(group2)
            self.groups.append(group3)
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: -- Configure CollectionView
    fileprivate func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // register cell
        self.collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: Idetidiers.appsGroupCell)
        // 1- register header ☑️
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Idetidiers.appsViewHeader)
    }
    
    fileprivate func configureActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
    }
}

// MARK: -- Extension for DataSourse And Delegate
extension AppsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.appsGroupCell, for: indexPath) as! AppsGroupCell
        
        cell.titleLabel.text = groups[indexPath.item].feed.title
        cell.controller.appGroup = groups[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}

// MARK: -- Header
extension AppsViewController {
    // 2- For Header ☑️
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Idetidiers.appsViewHeader, for: indexPath) as! AppsPageHeader
        header.appHeaderHorController.socials = socialApps
        return header
    }
    
    // 3- For Header ☑️
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 300)
    }
}
