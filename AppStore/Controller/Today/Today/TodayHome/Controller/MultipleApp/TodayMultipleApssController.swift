//
//  TodayMultipleApssController.swift
//  AppStore
//
//  Created by KH on 23/06/2022.
//

import UIKit

class TodayMultipleApssController: BaseViewController {
    
    fileprivate let mode: Mode
    
    enum Mode {
        case smallScreen, fullScreen
    }
    
    init(mode: Mode) {
        self.mode = mode
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error Happen")
    }
    
    
    var results = [FeedResults]()
    let closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "close.png"), for: .normal)
        btn.tintColor = .darkGray
        btn.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        if mode == .fullScreen {
            configuteCloseButton()
        } else {
            collectionView.isScrollEnabled = false
        }
        
        var prefersStatusBarHidden: Bool { return true }
    }
    
    fileprivate func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(MultipleAppCell.self, forCellWithReuseIdentifier: Idetidiers.todayMultipleApssController)
    }
    
    fileprivate func configuteCloseButton() {
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
    }
    
    @objc fileprivate func handleClose() {
        dismiss(animated: true)
    }
}

extension TodayMultipleApssController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mode == .fullScreen {
            return results.count
        }
        return min(4, results.count)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Idetidiers.todayMultipleApssController, for: indexPath) as! MultipleAppCell
        cell.feedResults = results[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if mode == .fullScreen {
            return .init(width: view.frame.width - 48, height: 74)
        } else {
            let height = (view.frame.height - 3 * 16) / 4
            return .init(width: view.frame.width, height: height)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if mode == .fullScreen {
            return .init(top: 30, left: 16, bottom: 16, right: 16)
        } else {
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}


