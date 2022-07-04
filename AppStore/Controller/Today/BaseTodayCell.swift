//
//  BaseTodayCell.swift
//  AppStore
//
//  Created by KH on 26/06/2022.
//

import UIKit

class BaseTodayCell: UICollectionViewCell {
  
    var todayItem: TodayItem!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.1
        layer.cornerRadius = 16
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
