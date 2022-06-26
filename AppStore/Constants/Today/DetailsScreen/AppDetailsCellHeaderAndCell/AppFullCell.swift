////
////  AppFullCell.swift
////  AppStore
////
////  Created by KH on 21/06/2022.
////
//
//import UIKit
//
//class AppFullCell: UITableViewCell {
//    
//    let descriptionLabel: UILabel = {
//        let label = UILabel()
//        
//        let attributeText = NSMutableAttributedString(string: "Greet games ", attributes: [.foregroundColor: UIColor.black])
//        attributeText.append(NSMutableAttributedString(string: "are all about the details, from subtle visual", attributes: [.foregroundColor: UIColor.gray]))
//    
//        attributeText.append(NSMutableAttributedString(string: "\n\n\nHeroic adventure ", attributes: [.foregroundColor: UIColor.black]))
//        attributeText.append(NSMutableAttributedString(string: "are all about the details, from subtle visual", attributes: [.foregroundColor: UIColor.gray]))
//
//        attributeText.append(NSMutableAttributedString(string: "\n\n\nHeroic adventure ", attributes: [.foregroundColor: UIColor.black]))
//        attributeText.append(NSMutableAttributedString(string: "are all about the details, from subtle visual are all about the details, from subtle visual are all about the details, from subtle visual are all about the details, from subtle visual", attributes: [.foregroundColor: UIColor.gray]))
//        
//        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
//        label.numberOfLines = 0
//        label.attributedText = attributeText
//        
//        return label
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(descriptionLabel)
//        descriptionLabel.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(24)
//            make.top.equalToSuperview().offset(24)
//            make.trailing.equalToSuperview().offset(-24)
//            make.bottom.equalToSuperview()
//        }
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
