//
//  AppDelegate.swift
//  AppStore
//
//  Created by KH on 17/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = BaseTabBarController()
        window?.makeKeyAndVisible()
        return true
    }
    
}

