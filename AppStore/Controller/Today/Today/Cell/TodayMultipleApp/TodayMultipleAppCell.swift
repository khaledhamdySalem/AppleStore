//
//  TodayMultipleAppCell.swift
//  AppStore
//
//  Created by KH on 02/07/2022.
//

import UIKit

class TodayMultipleAppCell: BaseTodayCell {
    
    override var todayItem: TodayItem? {
        didSet {
            categoryLabel.text = todayItem?.category
            titleLabel.text = todayItem?.title
            multipleAppsController.appResults = todayItem?.apps ?? []
        }
    }
    
    let categoryLabel = UILabel(text: "", font: UIFont.boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "", font: UIFont.boldSystemFont(ofSize: 32), numberOfLines: 2)
    let multipleAppsController = TodayMultipleAppsController(mode: .smallScreen)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureStack()
    }
    
    // MARK: -- Configure Cell
    fileprivate func configureCell() {
        backgroundColor = .white
    }
    
    // MARK: -- configureStack
    fileprivate func configureStack() {
        
        let verticalStack = VerticalStackView(arrangedSubviews: [
            categoryLabel,
            titleLabel,
            multipleAppsController.view
        ], spacing: 12)
        
        addSubview(verticalStack)
        verticalStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
