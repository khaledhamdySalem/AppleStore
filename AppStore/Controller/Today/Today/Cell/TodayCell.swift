//
//  TodayCell.swift
//  AppStore
//
//  Created by KH on 01/07/2022.
//

import UIKit

class TodayCell: BaseTodayCell {
    
    //MARK: -- Properties
    var topConstraint: NSLayoutConstraint?
    
    override var todayItem: TodayItem? {
        didSet {
            categoryLabel.text = todayItem?.category
            titleLabel.text = todayItem?.title
            imageView.image = todayItem?.image
            descriptionLabel.text = todayItem?.description
            backgroundColor = todayItem?.backgroundColor
        }
    }
    
    let categoryLabel = UILabel(text: "LIFE HACK", font: UIFont.boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "Utilize Your Time", font: UIFont.boldSystemFont(ofSize: 28))
    let imageView = UIImageView(cornerRad: 0, image: #imageLiteral(resourceName: "garden1"))
    let containerImage = UIView()
    let descriptionLabel = UILabel(text: "All the tools All the tools All the tools All the tools All the tools All the tools All the tools All the tools All the tools All the tools", font: UIFont.systemFont(ofSize: 16), numberOfLines: 3)
    
    //MARK: -- Iint
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureStack()
    }
    
    //MARK: -- Configure Cell
    fileprivate func configureCell() {
        backgroundColor = .white
        layer.cornerRadius = 16
    }
    
    //MARK: -- Configure Stackview
    fileprivate func configureStack() {
        let verticalStack = VerticalStackView(arrangedSubviews: [
            categoryLabel, titleLabel, containerImage, descriptionLabel
        ], spacing: 8)
        addSubview(verticalStack)
        
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        self.topConstraint = verticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        topConstraint?.isActive = true
        
        verticalStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-24)
        }
                
        containerImage.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(240)
            make.width.equalTo(240)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
