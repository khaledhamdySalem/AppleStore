//
//  AppFullScreenDescriptionCell.swift
//  AppStore
//
//  Created by KH on 01/07/2022.
//

import UIKit

class AppFullScreenDescriptionCell: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        let attributeText = NSMutableAttributedString(string: "Hello 1", attributes: [.foregroundColor: UIColor.black])
        attributeText.append(NSMutableAttributedString(string: " welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome ", attributes: [.foregroundColor: UIColor.lightGray]))
        
        attributeText.append(NSMutableAttributedString(string: "\n\nHello 1", attributes: [.foregroundColor: UIColor.black]))
        attributeText.append(NSMutableAttributedString(string: " Hello2 welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome ", attributes: [.foregroundColor: UIColor.lightGray]))
        
        attributeText.append(NSMutableAttributedString(string: "\n\nHello 1", attributes: [.foregroundColor: UIColor.black]))
        attributeText.append(NSMutableAttributedString(string: " Hello3 welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome ", attributes: [.foregroundColor: UIColor.lightGray]))
        
        attributeText.append(NSMutableAttributedString(string: "\n\nHello 1", attributes: [.foregroundColor: UIColor.black]))
        attributeText.append(NSMutableAttributedString(string: " Hello4 welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome welcome ", attributes: [.foregroundColor: UIColor.lightGray]))
        
        label.attributedText = attributeText
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        selectionStyle = .none
        label.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
