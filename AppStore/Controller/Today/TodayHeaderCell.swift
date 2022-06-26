//
//  TodayHeaderCell.swift
//  AppStore
//
//  Created by KH on 25/06/2022.
//

import UIKit

class TodayHeaderCell: UITableViewCell {

    let todayCell = TodayCell()
    let closeButton: UIButton = {
       let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "close.png"), for: .normal)
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(todayCell)
        todayCell.fillSuperview()
        
        addSubview(closeButton)
        closeButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 48, left: 0, bottom: 0, right: 30), size: .init(width: 30, height: 30))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
