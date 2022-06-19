//
//  BaseTabBarController.swift
//  AppStore
//
//  Created by KH on 17/06/2022.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewControllers = [
            createTabBarCon(AppsViewController(), navTitle: "Apps", tabBarTitle: "Apps", tabBarImage: #imageLiteral(resourceName: "apps")),
            createTabBarCon(SearchVC(), navTitle: "Search", tabBarTitle: "Search", tabBarImage: #imageLiteral(resourceName: "search")),
            createTabBarCon(UIViewController(), navTitle: "Today", tabBarTitle: "Today", tabBarImage: #imageLiteral(resourceName: "today_icon"))
        ]
    }
    
    // Create TabBarControlllers
    fileprivate func createTabBarCon(_ controller: UIViewController ,navTitle: String, tabBarTitle: String, tabBarImage: UIImage) -> UIViewController {
        controller.navigationItem.title = navTitle
      
        let navController = UINavigationController(rootViewController: controller)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = tabBarTitle
        navController.tabBarItem.image = tabBarImage
        
        return navController
    }
}
