//
//  UIViewController+Extension.swift
//  AppStore
//
//  Created by KH on 21/06/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func setTabBarHidden(_ hidden: Bool, animated: Bool = true, duration: TimeInterval = 0.5) {
        if self.tabBarController?.tabBar.isHidden != hidden{
            if animated {
                if (self.tabBarController?.tabBar.isHidden)!{
                    self.tabBarController?.tabBar.isHidden = hidden
                }
                if let frame = self.tabBarController?.tabBar.frame {
                    let factor: CGFloat = hidden ? 1 : -1
                    let y = frame.origin.y + (frame.size.height * factor)
                    UIView.animate(withDuration: duration, animations: {
                        self.tabBarController?.tabBar.frame = CGRect(x: frame.origin.x, y: y, width: frame.width, height: frame.height)
                    }) { (bool) in
                        if (!(self.tabBarController?.tabBar.isHidden)!){
                            self.tabBarController?.tabBar.isHidden = hidden
                        }
                    }
                }
            }
        }
    }
}
