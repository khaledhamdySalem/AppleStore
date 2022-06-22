//
//  TodayControllerViewController.swift
//  AppStore
//
//  Created by KH on 21/06/2022.
//


import UIKit

class TodayController: BaseViewController {
    
    var startingFrame: CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: Idetidiers.todayCell)
        navigationController?.isNavigationBarHidden = true
    }
}

extension TodayController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.todayCell, for: indexPath) as! TodayCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: Idetidiers.sizeOfCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let appFullScreenController = AppFullScreenController()
        let redView = appFullScreenController.view!
        view.addSubview(redView)
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView(gesture:))))
        redView.layer.cornerRadius = 16
        addChild(appFullScreenController)
                
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        redView.frame = startingFrame
        self.startingFrame = startingFrame
        // ↗️☑️✔️ AutoLayout Constraint Ainmation
        
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
            redView.frame = self.view.frame
            self.setTabBarHidden(true)
        }
    }
    
    @objc func handleRemoveRedView(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) {
            gesture.view?.frame = self.startingFrame ?? .zero
            self.setTabBarHidden(false)
        } completion: { _ in
            gesture.view?.removeFromSuperview()
        }
    }
}


