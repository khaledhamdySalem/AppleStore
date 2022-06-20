//
//  HorizontalStackView.swift
//  AppStore
//
//  Created by KH on 17/06/2022.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
