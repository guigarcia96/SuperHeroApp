//
//  AppDelegate.swift
//  SuperHero
//
//  Created by Guilherme Moraes on 28/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        // (1)
        window = UIWindow(frame: UIScreen.main.bounds)
        // (2)
        let searchViewController = SearchViewController()
        let navigationController = UINavigationController(rootViewController: searchViewController)
        window?.rootViewController = navigationController
        // (3)
        window?.makeKeyAndVisible()
        return true
    }
    
    
    
    
}

