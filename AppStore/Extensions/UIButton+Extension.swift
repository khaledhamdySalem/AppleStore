//
//  UIButton+Extension.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit

extension UIButton {
    convenience init(title: String, backgroundColor: UIColor?, titleColor: UIColor) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
    }
}
