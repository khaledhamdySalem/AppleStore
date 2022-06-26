////
////  TodayCell.swift
////  AppStore
////
////  Created by KH on 21/06/2022.
////
//
//import UIKit
//
//class TodayCell: BaseTodayCell {
//    
//    let categoryLabel = UILabel(text: "Life Hack", font: .boldSystemFont(ofSize: 20), numberOfLines: 1)
//    let titleLabel = UILabel(text: "Utilizing your Time", font: .boldSystemFont(ofSize: 26), numberOfLines: 1)
//    let imageView = UIImageView(cornerRad: 0, image: #imageLiteral(resourceName: "garden1"))
//    let imageConstainerView = UIView()
//    let descriptionLabel = UILabel(text: "All the tools and apps you need to intelligently organize your life the right way", font: .systemFont(ofSize: 16), numberOfLines: 0)
//    
//    override var todayItem: TodayItem? {
//        didSet {
//            titleLabel.text = todayItem?.title
//            descriptionLabel.text = todayItem?.description
//            imageView.image = todayItem?.image
//            categoryLabel.text = todayItem?.category
//            backgroundColor = todayItem?.backgroundColor
//        }
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setLayout()
//        configureImage()
//        configureStack()
//     }
//    
//    fileprivate func configureImage() {
//        imageConstainerView.addSubview(imageView)
//        imageView.centerInSuperview(size: .init(width: 240, height: 240))
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//    }
//    
//    fileprivate func configureStack() {
//        let stack = VerticalStackView(arrangedSubviews: [categoryLabel, titleLabel, imageConstainerView, descriptionLabel], spacing: 8)
//        addSubview(stack)
////        stack.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
//        stack.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide).offset(24)
//            make.leading.equalToSuperview().offset(24)
//            make.trailing.equalToSuperview().offset(-24)
//            make.bottom.equalToSuperview().offset(-24)
//        }
//    }
//    
//    fileprivate func setLayout() {
//        backgroundColor = .white
//        layer.cornerRadius = 16
//        clipsToBounds = true
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
