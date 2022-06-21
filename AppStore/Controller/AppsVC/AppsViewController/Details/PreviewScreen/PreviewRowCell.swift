//
//  PreviewCell.swift
//  AppStore
//
//  Created by KH on 20/06/2022.
//

import UIKit

class PreviewRowCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Preview", font: UIFont.boldSystemFont(ofSize: 26), numberOfLines: 1, tintColor: .black)
    let controller = PreviewScreenController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
        addSubview(controller.view)
        controller.view.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
