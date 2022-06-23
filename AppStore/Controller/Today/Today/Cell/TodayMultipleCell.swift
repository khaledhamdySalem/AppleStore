//
//  TodayMultipleCell.swift
//  AppStore
//
//  Created by KH on 22/06/2022.
//

import UIKit

class TodayMultipleCell: BaseTodayCell{
    
    override var todayItem: TodayItem? {
        didSet {
            categoryLabel.text = todayItem?.category
            titleLabel.text = todayItem?.title
        }
    }
    
    let categoryLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 20), numberOfLines: 1, tintColor: .lightGray)
    let titleLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 30), numberOfLines: 2)
    let controller = UIViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStack()
        backgroundColor = .white
        layer.cornerRadius = 16
        controller.view.backgroundColor = .red
    }
    
    fileprivate func configureStack() {
        let verStack = VerticalStackView(arrangedSubviews: [categoryLabel, titleLabel, controller.view], spacing: 12)
        addSubview(verStack)
        verStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-24)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
