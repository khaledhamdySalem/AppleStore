////
////  AppFullScreeDescriptionCell.swift
////  AppStore
////
////  Created by KH on 24/06/2022.
////
//
//import UIKit
//
//class AppFullScreeDescriptionCell: UITableViewCell {
//    
//    let label: UILabel = {
//        let label = UILabel()
//    
//        let attributeLabel = NSMutableAttributedString(string: "Great Games ", attributes: [.foregroundColor: UIColor.black])
//        attributeLabel.append(NSMutableAttributedString(string: "If you want to adjust paragraph-level settings - text alignment, indents, line spacing, and so on this is done using a separate type called NSMutableParagraphStyle. For example, this creates and applies a paragraph style to make our text centered and have the first line in every paragraph", attributes: [.foregroundColor: UIColor.lightGray]))
//        
//        attributeLabel.append(NSMutableAttributedString(string: "\n\n\n Heroic Games ", attributes: [.foregroundColor: UIColor.black]))
//        attributeLabel.append(NSMutableAttributedString(string: "If you want to adjust paragraph-level settings - text alignment, indents, line spacing, and so on this is done using a separate type called NSMutableParagraphStyle. For example, this creates and applies a paragraph style to make our text centered and have the first line in every paragraph", attributes: [.foregroundColor: UIColor.lightGray]))
//        
//        attributeLabel.append(NSMutableAttributedString(string: "\n\n\n Battle Games ", attributes: [.foregroundColor: UIColor.black]))
//        attributeLabel.append(NSMutableAttributedString(string: "If you want to adjust paragraph-level settings - text alignment, indents, line spacing, and so on this is done using a separate type called NSMutableParagraphStyle. For example, this creates and applies a paragraph style to make our text centered and have the first line in every paragraph", attributes: [.foregroundColor: UIColor.lightGray]))
//        
//        label.attributedText = attributeLabel
//        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
//        label.numberOfLines = 0
//        return label
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(label)
//        label.fillSuperview(padding: .init(top: 0, left: 16, bottom: 16, right: 16))
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
