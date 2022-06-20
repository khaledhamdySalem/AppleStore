//
//  HorizontalAppsVC.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit

class AppsHorizontalController: HorizontalSnappingController {
    
    fileprivate let topBottomPadding: CGFloat = 16
    fileprivate let lineSpacing: CGFloat = 10
    var didTapOnCell: ((FeedResults) -> ())?
    
    var appGroup: AppGroup? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: Idetidiers.AppsHorCell)
    }
}

extension AppsHorizontalController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let app = appGroup?.feed.results[indexPath.item]  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.AppsHorCell, for: indexPath) as! AppRowCell
            cell.configureCell(app: app)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2*topBottomPadding - 2*lineSpacing)/3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: lineSpacing, bottom: topBottomPadding, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let app = appGroup?.feed.results[indexPath.item]
        didTapOnCell?(app!)
    }
}
