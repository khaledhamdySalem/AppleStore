//
//  AppDetailsCell.swift
//  AppStore
//
//  Created by KH on 20/06/2022.
//

import UIKit

class AppDetailsCell: UICollectionViewCell {
    
    // MARK: -- Properties
    let appIconImageView = UIImageView(cornerRad: 16, image: UIImage())
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    let priceButton = UIButton(title: "$4.99", backgroundColor: UIColor.blue, titleColor: UIColor.white)
    let whatsNewLabel = UILabel(text: "What's New", font: .boldSystemFont(ofSize: 16), numberOfLines: 0)
    let releaseNotesLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 18), numberOfLines: 0, tintColor: .black)
    
    // MARK: -- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButtonAndImageSize()
        configureStackView()
    }
    
    // MARK: -- Configure ButtonAndImageSize
    fileprivate func configureButtonAndImageSize() {
        appIconImageView.constrainHeight(constant: 140)
        appIconImageView.constrainWidth(constant:  140)
        priceButton.constrainWidth(constant:  80)
        priceButton.constrainHeight(constant: 32)
        priceButton.layer.cornerRadius = 32/2
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    // MARK: -- Configure StackView
    fileprivate func configureStackView() {
        let vStack = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [appIconImageView, VerticalStackView(arrangedSubviews: [nameLabel, UIStackView(arrangedSubviews: [priceButton, UIView()]), UIView()], spacing: 12)], customSpacing: 20), whatsNewLabel, releaseNotesLabel], spacing: 16)
        
        addSubview(vStack)
        vStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: -- Update Cell
    func updateCell(app: Result) {
        nameLabel.text = app.trackName
        releaseNotesLabel.text = app.releaseNotes
        appIconImageView.sd_setImage(with: URL(string: app.artworkUrl100))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
