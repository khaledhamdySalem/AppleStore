//
//  AppDetailsController.swift
//  AppStore
//
//  Created by KH on 20/06/2022.
//

import UIKit

class AppDetailsController: UIViewController {
    
    var app: Result?
    var reviews: ReviewResponse?
    
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
            
            guard let appId = appId else { return }

            let reviewUrl = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId)/sortby=mostrecent/json?%7C=en&cc=us"
            Service.shared.fetchGenaricJsonData(urlString: reviewUrl) { (result: ReviewResponse?, error) in
                guard let result = result else { return }
                self.reviews = result
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
        
        collectionView.register(AppDetailsRowCell.self, forCellWithReuseIdentifier: Idetidiers.appDetailsRowCell)
        collectionView.register(PreviewRowCell.self, forCellWithReuseIdentifier: Idetidiers.previewCell)
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: Idetidiers.reviewRowCell)
    }
}

extension AppDetailsController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.appDetailsRowCell, for: indexPath) as! AppDetailsRowCell
            if let app = app {
                cell.updateCell(app: app)
            }
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.previewCell, for: indexPath) as! PreviewRowCell
            cell.controller.app = app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.reviewRowCell, for: indexPath) as! ReviewRowCell
            cell.controller.reviews = reviews
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 0
        
        if indexPath.row == 0 {
            let cell = AppDetailsRowCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            if let app = app { cell.updateCell(app: app) }
            cell.layoutIfNeeded()
            
            let estimateSize = cell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            height = estimateSize.height
            
        } else if indexPath.row == 1 {
            height = 500
        } else {
            height = 280
        }
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
}

