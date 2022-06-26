////
////  HeaderCell.swift
////  AppStore
////
////  Created by KH on 24/06/2022.
////
//
//import UIKit
//
//class HeaderCell: UITableViewCell {
//
//    let button: UIButton = {
//        let btn = UIButton(type: .system)
//        btn.setImage(#imageLiteral(resourceName: "close.png"), for: .normal)
//        btn.tintColor = UIColor.blue
//        btn.constrainHeight(constant: 38)
//        btn.constrainWidth(constant: 80)
//        return btn
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        addSubview(button)
//        button.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
