////
////  AppHeaderFullDetailsCell.swift
////  AppStore
////
////  Created by KH on 22/06/2022.
////
//
//import UIKit
//
//class AppHeaderFullDetailsCell: UITableViewCell {
//        
//    let todayCell = TodayCell()
//    let closeButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(#imageLiteral(resourceName: "close.png"), for: .normal)
//        return button
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(todayCell)
//        todayCell.fillSuperview()
//        
//        addSubview(closeButton)
//        closeButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 48, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 38))
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
