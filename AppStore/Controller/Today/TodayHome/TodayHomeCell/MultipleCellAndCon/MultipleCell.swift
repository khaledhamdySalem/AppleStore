//
//  MultipleCell.swift
//  AppStore
//
//  Created by KH on 25/06/2022.
//

import UIKit

class MultipleCell: UICollectionViewCell {
  
    var app: FeedResults? {
        didSet {
            nameLabel.text = app?.name
            companyLabel.text = app?.artistName
            imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        }
    }
    
    let imageView = UIImageView(cornerRad: 8,
                                image: UIImage())
    
    let nameLabel = UILabel(text: "App Name",
                            font: .systemFont(ofSize: 20),
                            numberOfLines: 1)
    
    let companyLabel = UILabel(text: "Company Name",
                               font: .systemFont(ofSize: 13),
                               numberOfLines: 1,
                               tintColor: .lightGray)
    
    let seprateView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        return v
    }()
    
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
        horStackView.fillSuperview()
        horStackView.spacing = 16
        horStackView.alignment = .center
        
        addSubview(seprateView)

        seprateView.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(8)
            make.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
