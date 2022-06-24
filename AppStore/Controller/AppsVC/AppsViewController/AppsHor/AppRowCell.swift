//
//  AppsHorCell.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRad: 8,
                                image: UIImage(),
                                background: .purple)
    
    let nameLabel = UILabel(text: "App Name",
                            font: .systemFont(ofSize: 20),
                            numberOfLines: 1)
    
    let companyLabel = UILabel(text: "Company Name",
                               font: .systemFont(ofSize: 13),
                               numberOfLines: 0)
    
    let getButton = UIButton(title: "Get", backgroundColor: UIColor.init(white: 0.95, alpha: 1), titleColor: UIColor.blue)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.constrainWidth(constant: 50)
        imageView.constrainHeight(constant: 50)
        
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32/2
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let labelStack = VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4)
        
        let horStackView = UIStackView(arrangedSubviews: [imageView, labelStack, getButton])
        addSubview(horStackView)
        horStackView.fillSuperview(padding: .init(top: 0, left: 8, bottom: 0, right: 8))
        horStackView.spacing = 16
        horStackView.alignment = .center
    }
    
    func configureCell(app: FeedResults) {
        nameLabel.text = app.name
        companyLabel.text = app.artistName
        imageView.sd_setImage(with: URL(string: app.artworkUrl100))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



