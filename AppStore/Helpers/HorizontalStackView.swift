//
//  HorizontalStackView.swift
//  AppStore
//
//  Created by KH on 17/06/2022.
//

import UIKit

class HorizontalStackView: UIStackView {
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
         super.init(frame: .zero)
        self.spacing = spacing
        axis = .horizontal
        self.arrangedSubviews.forEach({addArrangedSubview($0)})
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
