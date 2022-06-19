//
//  UILabel+Extension.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1, tintColor: UIColor = .black) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
        self.textColor = tintColor
    }
}

