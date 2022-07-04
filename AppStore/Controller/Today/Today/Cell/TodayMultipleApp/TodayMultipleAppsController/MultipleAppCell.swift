//
//  MultipleAppCell.swift
//  AppStore
//
//  Created by KH on 02/07/2022.
//

import UIKit

class MultipleAppCell: UICollectionViewCell {
    
    var app: FeedResults? {
        didSet {
            companyLabel.text = app?.artistName
            nameLabel.text = app?.name
            imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        }
    }
    
    let imageView = UIImageView(cornerRad: 8,
                                image: UIImage(),
                                background: .purple)
    
    let nameLabel = UILabel(text: "App Name",
                            font: .systemFont(ofSize: 20),
                            numberOfLines: 1)
    
    let companyLabel = UILabel(text: "Company Name",
                               font: .systemFont(ofSize: 13),
                               numberOfLines: 2)
    
    let getButton = UIButton(title: "Get", backgroundColor: UIColor.init(white: 0.95, alpha: 1), titleColor: UIColor.blue)
    
    let seperateView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.init(white: 0.3, alpha: 0.3)
        v.constrainHeight(constant: 0.5)
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    fileprivate func configureCell() {
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
        
        addSubview(seperateView)
        seperateView.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
