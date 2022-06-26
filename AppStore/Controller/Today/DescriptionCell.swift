//
//  DescriptionCell.swift
//  AppStore
//
//  Created by KH on 25/06/2022.
//

import UIKit

class DescriptionCell: UITableViewCell {
    
    let label: UILabel = {
        
        let label = UILabel()
        let attributeText = NSMutableAttributedString(string: "Great Games ", attributes: [.foregroundColor: UIColor.black])
        attributeText.append(NSMutableAttributedString(string: "ss ss ss ss ss ss ss ss ss ss ss ss ss ss", attributes: [.foregroundColor: UIColor.lightGray]))
        
        attributeText.append(NSMutableAttributedString(string: "\n\n\nBlack Games ", attributes: [.foregroundColor: UIColor.black]))
        attributeText.append(NSMutableAttributedString(string: "ss ss ss ss ss ss ss ss ss ss ss ss ss ss", attributes: [.foregroundColor: UIColor.lightGray]))
        
        attributeText.append(NSMutableAttributedString(string: "\n\n\nWhite Games ", attributes: [.foregroundColor: UIColor.black]))
        attributeText.append(NSMutableAttributedString(string: "ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss ss", attributes: [.foregroundColor: UIColor.lightGray]))
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.attributedText = attributeText
        label.numberOfLines = 0
        
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        label.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
