//
//  MultipleCollectionViewCell.swift
//  AppStore
//
//  Created by KH on 25/06/2022.
//

import UIKit

class MultipleCollectionViewCell: BaseTodayCell {
    
    override var todayItem: TodayItem? {
        didSet {
            categoryLabel.text = todayItem?.category
            titleLabel.text = todayItem?.title
            controler.apps = todayItem?.apps ?? []
            controler.collectionView.reloadData()
        }
    }
    
    let categoryLabel     = UILabel(text: "", font: UIFont.boldSystemFont(ofSize: 20), numberOfLines: 1, tintColor: .lightGray)
    let titleLabel        = UILabel(text: "", font: UIFont.boldSystemFont(ofSize: 32), numberOfLines: 2)
    let controler         = TodayMultipleApssViewController(mode: .smallScreen)

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        backgroundColor = .white
        clipsToBounds = true
        let verticalStack = VerticalStackView(arrangedSubviews: [categoryLabel, titleLabel, controler.view], spacing: 12)
        addSubview(verticalStack)
        verticalStack.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
