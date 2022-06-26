////
////  MultipleAppCell.swift
////  AppStore
////
////  Created by KH on 23/06/2022.
////
//
//import UIKit
//
//class MultipleAppCell: UICollectionViewCell {
//
//    var feedResults: FeedResults? {
//        didSet {
//            imageData.sd_setImage(with: URL(string: feedResults?.artworkUrl100 ?? ""))
//            nameLabel.text = feedResults?.name
//            companyLabel.text = feedResults?.artistName
//        }
//    }
//
//    let imageData = UIImageView(cornerRad: 8,
//                                image: UIImage())
//
//    let nameLabel = UILabel(text: "",
//                            font: .systemFont(ofSize: 20),
//                            numberOfLines: 1)
//
//    let companyLabel = UILabel(text: "",
//                               font: .systemFont(ofSize: 13),
//                               numberOfLines: 1)
//
//    let getButton = UIButton(title: "Get", backgroundColor: UIColor.init(white: 0.95, alpha: 1), titleColor: UIColor.blue)
//
//    let seperateView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
//        view.constrainHeight(constant: 0.5)
//        return view
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        configureCell()
//        let horStack = UIStackView(arrangedSubviews: [imageData,
//                                                      VerticalStackView(arrangedSubviews: [
//                                                        nameLabel, companyLabel], spacing: 4), getButton], customSpacing: 4)
//        horStack.spacing = 16
//        horStack.alignment = .center
//        addSubview(horStack)
//        horStack.fillSuperview()
//
//        addSubview(seperateView)
//        seperateView.anchor(top: nil,
//                            leading: nameLabel.leadingAnchor,
//                            bottom: bottomAnchor,
//                            trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: -8, right: 0))
//    }
//
//    fileprivate func configureCell() {
//        imageData.constrainWidth(constant: 50)
//        imageData.constrainHeight(constant: 50)
//
//        getButton.constrainHeight(constant: 32)
//        getButton.layer.cornerRadius = 32/2
//        getButton.constrainWidth(constant: 60)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
