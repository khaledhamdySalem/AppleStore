//
//  ReviewsCell.swift
//  AppStore
//
//  Created by KH on 20/06/2022.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    var enrty: Entry? {
        didSet {
            titleLabel.text = enrty?.title.label
            authorLabel.text = enrty?.author.name.label
            bodyLabel.text = enrty?.content.label
            guard let ratingInt = Int(enrty?.rating.label ?? "") else { return }
            
            for (index, view) in starStack.arrangedSubviews.enumerated() {
                view.alpha = index >= ratingInt ? 0: 1
            }
        }
    }
    
    let titleLabel = UILabel(text: "Review Title", font: UIFont.boldSystemFont(ofSize: 18), numberOfLines: 1)
    let authorLabel = UILabel(text: "Review Title", font: UIFont.systemFont(ofSize: 16), numberOfLines: 1)
    let bodyLabel = UILabel(text: "Review Title \nReview Title \nReview Title ", font: UIFont.systemFont(ofSize: 18), numberOfLines: 0)
    let starStack: UIStackView = {
        var arrangedSubviews = [UIView]()
        (0..<5).forEach { _ in
            let imageView = UIImageView(cornerRad: 0, image: #imageLiteral(resourceName: "star.png"))
            imageView.constrainWidth(constant: 24)
            imageView.constrainHeight(constant: 24)
            arrangedSubviews.append(imageView)
        }
        arrangedSubviews.append(UIView())
        return UIStackView(arrangedSubviews: arrangedSubviews)
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureStackView()
    }
    
     fileprivate func configureStackView() {
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorLabel.textAlignment = .right
        
        let labelsStack = UIStackView(arrangedSubviews: [
            titleLabel, UIView(), authorLabel],
                                      customSpacing: 12)
        
        let verStack = VerticalStackView(arrangedSubviews: [
            labelsStack,starStack, bodyLabel, UIView()],
                                         spacing: 12)
          addSubview(verStack)
        verStack.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.bottom.trailing.equalToSuperview().offset(-20)
        }
    }
    
    fileprivate func configureCell() {
        backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9411764706, blue: 0.9725490196, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
