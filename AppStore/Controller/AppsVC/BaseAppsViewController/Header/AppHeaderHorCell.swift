//
//  AppHeaderHorCell.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit

class AppHeaderHorCell: UICollectionViewCell {
    
    let companyLabel = UILabel(text: "Facebook", font: UIFont.boldSystemFont(ofSize: 12), numberOfLines: 1, tintColor: .blue)
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: UIFont.systemFont(ofSize: 24), numberOfLines: 2, tintColor: .black)
    let imageView = UIImageView(cornerRad: 8, image: UIImage(), background: .red)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let verStack = VerticalStackView(arrangedSubviews: [
            companyLabel, titleLabel, imageView
        ], spacing: 12)
        
        addSubview(verStack)
        verStack.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

