//
//  SearchCell.swift
//  AppStore
//
//  Created by KH on 17/06/2022.
//

import UIKit
import SDWebImage

class SearchCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let img = UIImageView()
        img.constrainHeight(constant: 64)
        img.constrainWidth(constant: 64)
        img.layer.cornerRadius = 12
        img.clipsToBounds = true
        return img
    }()
    var topHorStack = UIStackView()
    var screenShotStack = UIStackView()
    var overAllStack = UIStackView()
    
    let nameLabel = createLabel(labelText: "Instgram")
    let categoryLabel = createLabel(labelText: "Photo & Video")
    let ratingLabel = createLabel(labelText: "9.72 am")
    
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Get", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.backgroundColor = .lightGray
        btn.tintColor = UIColor.white
        btn.constrainWidth(constant: 80)
        btn.layer.cornerRadius = 16
        //        btn.constrainHeight(constant: 80)
        return btn
    }()
    
    let screenShot1 = createScreenShot()
    let screenShot2 = createScreenShot()
    let screenShot3 = createScreenShot()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureToStackView()
        configureScreenShotStackView()
        configureOverAllStackView()
    }
    
    func configureToStackView() {
        let labelsStack = VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel], spacing: 4)
        topHorStack = UIStackView(arrangedSubviews: [ imageView, labelsStack, button ])
        topHorStack.spacing = 12
        topHorStack.alignment = .center
    }
    
    fileprivate func configureScreenShotStackView() {
        screenShotStack = UIStackView(arrangedSubviews: [screenShot1, screenShot2, screenShot3])
        screenShotStack.spacing = 12
        screenShotStack.distribution = .fillEqually
    }
    
    fileprivate func configureOverAllStackView() {
        overAllStack = VerticalStackView(arrangedSubviews: [topHorStack, screenShotStack], spacing: 16)
        addSubview(overAllStack)
        overAllStack.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    func configureCell(items: Result) {
        nameLabel.text = items.trackName
        ratingLabel.text = items.avgRating
        categoryLabel.text = items.primaryGenreName
        imageView.sd_setImage(with: items.imageUrl)
        screenShot1.sd_setImage(with: URL(string: items.screenshotUrls?[0] ?? ""))
        screenShot2.sd_setImage(with: URL(string: items.screenshotUrls?[1] ?? ""))
        if items.screenshotUrls?.count ?? 0 > 2 {
            screenShot3.sd_setImage(with: URL(string: items.screenshotUrls?[2] ?? ""))
        } else {
            screenShot3.sd_setImage(with: URL(string: items.screenshotUrls?[1] ?? ""))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



func createLabel(labelText: String) -> UILabel {
    let label = UILabel()
    label.text = labelText
    return label
}

func createScreenShot() -> UIImageView {
    let image = UIImageView()
    image.layer.cornerRadius = 8
    image.layer.borderWidth = 0.5
    image.clipsToBounds = true
    image.layer.borderColor = UIColor.init(white: 0.5, alpha: 0.5).cgColor
    image.contentMode = .scaleAspectFill
    return image
}
