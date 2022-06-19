//
//  UIImage+Extension.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit

extension UIImageView {
    convenience init(cornerRad: CGFloat ,image: UIImage?, background: UIColor = .clear) {
        self.init(frame: .zero)
        self.layer.cornerRadius = cornerRad
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        self.image = image
        self.backgroundColor = background
    }
}



