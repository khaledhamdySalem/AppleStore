//
//  BaseViewController.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class BaseViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
