//
//  TodayCell.swift
//  AppStore
//
//  Created by KH on 25/06/2022.
//

import UIKit

class TodayCell: BaseTodayCell {
    
    override var todayItem: TodayItem? {
        didSet {
            categoryLabel.text = todayItem?.category
            titleLabel.text = todayItem?.title
            imageView.image = todayItem?.image
            descriptionLabel.text = todayItem?.description
            backgroundColor = todayItem?.backgroundColor
        }
    }
    
    var topConstraint: NSLayoutConstraint?
    let constainerImage   = UIView()
    let categoryLabel     = UILabel(text: "", font: UIFont.boldSystemFont(ofSize: 20), numberOfLines: 1)
    let titleLabel        = UILabel(text: "", font: UIFont.boldSystemFont(ofSize: 26), numberOfLines: 1)
    let imageView         = UIImageView(cornerRad: 0, image: #imageLiteral(resourceName: "garden1"))
    let descriptionLabel  = UILabel(text: "", font: UIFont.systemFont(ofSize: 16), numberOfLines: 0)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureStackView()
    }
    
    fileprivate func configureCell() {
        backgroundColor = .white
        layer.cornerRadius = 16
    }
    
    fileprivate func configureStackView() {
        let verticalStack = VerticalStackView(arrangedSubviews: [categoryLabel,
                                                                 titleLabel,
                                                                 constainerImage,
                                                                 descriptionLabel], spacing: 8)
        constainerImage.addSubview(imageView)
        imageView.centerInSuperview()
        imageView.constrainHeight(constant: 250)
        imageView.constrainWidth(constant: 250)
        addSubview(verticalStack)
   
        verticalStack.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor,
                             trailing: trailingAnchor, padding: .init(top: 0,
                                                                      left: 24,
                                                                      bottom: 24,
                                                                      right: 24))
    
        topConstraint = verticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        topConstraint?.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
