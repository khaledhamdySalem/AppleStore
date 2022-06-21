//
//  ReviewRowCell.swift
//  AppStore
//
//  Created by KH on 20/06/2022.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Reviews & Ratings", font: UIFont.boldSystemFont(ofSize: 26), numberOfLines: 1, tintColor: .black)
    let controller = ReviewsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        addSubview(controller.view)
        controller.view.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
