////
////  BackEnableNavController.swift
////  AppStore
////
////  Created by KH on 26/06/2022.
////

import UIKit

class BackEnableNavController: UINavigationController, UIGestureRecognizerDelegate {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count >= 1
    }
}
