//
//  AppHeaderHorController.swift
//  AppStore
//
//  Created by KH on 18/06/2022.
//

import UIKit

class AppHeaderHorController: HorizontalSnappingController {
    
    var socials: [SocialHeaderResponse]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppHeaderHorCell.self, forCellWithReuseIdentifier: Idetidiers.appHeaderHorCell)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
}

extension AppHeaderHorController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socials?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.appHeaderHorCell, for: indexPath) as! AppHeaderHorCell
        cell.socials = socials?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 42, height: view.frame.height)
    }
}
