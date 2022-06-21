//
//  PreviewScreenController.swift
//  AppStore
//
//  Created by KH on 20/06/2022.
//

import UIKit

class PreviewScreenController: HorizontalSnappingController {
    
    var app: Result? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: Idetidiers.screenShotCell)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 16, right: 16)
    }
}


extension PreviewScreenController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.screenShotCell, for: indexPath) as! ScreenShotCell
        cell.imageView.sd_setImage(with: URL(string: app?.screenshotUrls[indexPath.item]  ?? ""))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: 250, height: view.frame.height)
    }
    
}
