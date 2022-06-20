//
//  AppsPageHeader.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let appHeaderHorController = AppHeaderHorController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appHeaderHorController.view)
        appHeaderHorController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
