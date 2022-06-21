//
//  ReviewsController.swift
//  AppStore
//
//  Created by KH on 20/06/2022.
//

import UIKit

class ReviewsController: HorizontalSnappingController {
    
    var reviews: ReviewResponse? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: Idetidiers.reviewsCell)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 16, right: 16)
    }
}

extension ReviewsController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews?.feed.entry.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.reviewsCell, for: indexPath) as! ReviewCell
        let entry = reviews?.feed.entry[indexPath.item]
        cell.enrty = entry
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width - 32, height: view.frame.height)
    }
    
}
