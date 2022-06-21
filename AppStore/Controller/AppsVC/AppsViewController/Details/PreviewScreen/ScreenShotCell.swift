//
//  ScreenShotCell.swift
//  AppStore
//
//  Created by KH on 20/06/2022.
//

import UIKit

class ScreenShotCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRad: 16, image: UIImage())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.contentMode = .scaleToFill
        imageView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
