//
//  TodayMultipleAppsController.swift
//  AppStore
//
//  Created by KH on 02/07/2022.
//

import UIKit

class TodayMultipleAppsController: BaseViewController {
    
    // MARK: -- Properties
    var appResults: [FeedResults]! {
        didSet {
            self.collectionView.reloadData()
        }
    }
    let spacing: CGFloat = 16
    
    let closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "close.png"), for: .normal)
        btn.tintColor = .darkGray
        btn.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        return btn
    }()
    
    fileprivate let mode: Mode
    
    enum Mode {
        case smallScreen, fullScreen
    }
    
    init(mode: Mode) {
        self.mode = mode
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        if mode == .fullScreen {
            configureCloseButton()
            collectionView.isScrollEnabled = false
        } else {
            collectionView.isScrollEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if mode == .fullScreen {
            self.navigationController?.isNavigationBarHidden = true
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: -- Configure CollectionView
    fileprivate func configureCollectionView() {
        collectionView.register(MultipleAppCell.self, forCellWithReuseIdentifier: Idetidiers.multipleCell)
    }
    
    // MARK: -- Configure CloseButton
    fileprivate func configureCloseButton() {
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
    }
    
    @objc fileprivate func handleClose(button: UIButton) {
        dismiss(animated: true)
    }
}

// MARK: -- Datasourse and Delegate
extension TodayMultipleAppsController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mode == .fullScreen {
            return appResults.count
        } else {
            return min(4, appResults.count)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.multipleCell, for: indexPath) as! MultipleAppCell
        cell.app = appResults[indexPath.item]
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if mode == .fullScreen {
            return .init(width: view.frame.width - 48, height: 64)
        } else {
            return .init(width: view.frame.width, height:  (view.frame.height - 3 * spacing) / 4)
        }
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if mode == .fullScreen {
            let vc = AppDetailsController(appId: appResults[indexPath.item].id)
            vc.modalPresentationStyle = .fullScreen
            self.show(vc, sender: true)
        } else {
            let vc = AppDetailsController(appId: appResults[indexPath.item].id)
            self.show(vc, sender: true)
        }
    }
}
