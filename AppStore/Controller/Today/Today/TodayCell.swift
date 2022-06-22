//
//  TodayCell.swift
//  AppStore
//
//  Created by KH on 21/06/2022.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRad: 0, image: #imageLiteral(resourceName: "garden1"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        configureImage()
     }
    
    fileprivate func configureImage() {
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.centerInSuperview(size: .init(width: 250, height: 250))
    }
    
    fileprivate func setLayout() {
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
