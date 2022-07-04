//
//  HeaderCell.swift
//  AppStore
//
//  Created by KH on 01/07/2022.
//

import UIKit

class AppFullScreenHeaderCell: UITableViewCell {
    
    // MARK: -- Properties
    let headerCell = TodayCell()
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "close.png"), for: .normal)
        return button
    }()
    
    // MARK: -- Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        handleCloseButton()
    }
    
    // MARK: -- Configure Cell
    fileprivate func configureCell() {
        addSubview(headerCell)
        headerCell.fillSuperview()
    }
    
    // MARK: -- Handle Close Button
    fileprivate func handleCloseButton() {
        addSubview(closeButton)
        closeButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 44, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 38))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
