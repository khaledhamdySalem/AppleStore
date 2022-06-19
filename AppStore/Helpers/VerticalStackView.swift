//
//  VerticalStackView.swift
//  AppStore
//
//  Created by KH on 17/06/2022.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        arrangedSubviews.forEach { addArrangedSubview($0) }
        self.spacing = spacing
        axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
