//
//  TodayMultipleApssViewController.swift
//  AppStore
//
//  Created by KH on 25/06/2022.
//

import UIKit

class TodayMultipleApssViewController: BaseViewController {
    
    var apps = [FeedResults]()
    fileprivate let spacing: CGFloat = 16
    let closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "close.png"), for: .normal)
        btn.tintColor = .darkGray
        btn.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        return btn
    }()
    
    let mode: Mode
    
    enum Mode: String {
        case smallScreen, fullScreen
    }
    
    init(mode: Mode) {
        self.mode = mode
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    // MARK: -- Configure CollectionView
    fileprivate func configureCollectionView() {
        if mode == .fullScreen {
            configureCloseButton()
        } else {
            collectionView.isScrollEnabled = false
        }
        collectionView.register(MultipleCell.self, forCellWithReuseIdentifier: "MultipleCell")
    }
    
    fileprivate func configureCloseButton() {
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
    }
    
    @objc fileprivate func handleClose() {
        dismiss(animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// MARK: -- Extension
extension TodayMultipleApssViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mode == .fullScreen {
            return apps.count
        }
        return  min(4, apps.count)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MultipleCell", for: indexPath) as! MultipleCell
        cell.app = apps[indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        var height: CGFloat = 68
        
        if mode == .fullScreen {
            return .init(width: view.frame.width - 48 , height: height)
        }
        
        height = (view.frame.height - 3 * spacing) / 4
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if mode == .fullScreen {
            return .init(top: 16, left: 24, bottom: 16, right: 24)
        }
        return .zero
    }
}
