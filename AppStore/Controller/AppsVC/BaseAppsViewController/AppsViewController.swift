//
//  AppsViewController.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit

class AppsViewController: UIViewController {
    
    // MARK: -- Properties
    var appGroup: AppGroup?
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCollectionView()
        fetchData()
    }
    
    // MARK: -- Fetching Data ✔️
    fileprivate func fetchData() {
        Service.shared.fetchGames { appGroup, error in
            if let error = error {
                print(error)
            }
            
            self.appGroup = appGroup
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
    
    // 2- For Header ☑️
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Idetidiers.appsViewHeader, for: indexPath) as! AppsPageHeader
        
        return header
    }
    
    // 3- For Header ☑️
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 0, height: 300)
    }
}


// MARK: -- Extension for DataSourse And Delegate
extension AppsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.appsGroupCell, for: indexPath) as! AppsGroupCell
        cell.titleLabel.text = appGroup?.feed.title
        cell.controller.appGroup = appGroup
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}

// If I want to create header
// 1- Adding register for header like this
// collectionView.register("", forSupplementaryViewOfKind: "", withReuseIdentifier: "")

// 2- adding viewforsupplay like this
/*
 func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
 let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Idetidiers.appsViewHeader, for: indexPath)
 return header
 }
 */


//3 - retutn height of header using ( referenceSizeForHeaderInSection )
