//
//  AppDetailsController.swift
//  AppStore
//
//  Created by KH on 20/06/2022.
//

import UIKit

class AppDetailsController: UIViewController {
    
    var app: Result?
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()
    
    var appId: String? {
        didSet {
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Service.shared.fetchGenaricJsonData(urlString: urlString) { (result: SearchResult?, err) in
                self.app = result?.results.first
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        title = "Details"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    fileprivate func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        // register cell
        self.collectionView.register(AppDetailsCell.self, forCellWithReuseIdentifier: Idetidiers.appDetailsCell)
    }
}

extension AppDetailsController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.appDetailsCell, for: indexPath) as! AppDetailsCell
        if let app = app {
            cell.updateCell(app: app)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cell = AppDetailsCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
        
        if let app = app {
            cell.updateCell(app: app)
        }
        cell.layoutIfNeeded()
        
        let estimateSize = cell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
        
        return .init(width: view.frame.width, height: estimateSize.height) 
    }
}

