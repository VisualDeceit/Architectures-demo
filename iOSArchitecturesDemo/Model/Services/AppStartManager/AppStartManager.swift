//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let appMVP = SearchAppAssembly.build()
        appMVP.navigationItem.title = "Search in App Store"
        appMVP.tabBarItem = UITabBarItem(title: "App", image: UIImage(systemName: "apps.iphone"), tag: 0)
        
        let musicMVP = SearchMusicAssembly.build()
        musicMVP.navigationItem.title = "Search in iTunes"
        musicMVP.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "music.quarternote.3"), tag: 1)
        
        let appNavVC = self.configuredAppNavigationController
        appNavVC.viewControllers = [appMVP]
        
        let musicNavVC = self.configuredMusicNavigationController
        musicNavVC.viewControllers = [musicMVP]
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([appNavVC, musicNavVC], animated: false)
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }
    
    private lazy var configuredAppNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
    
    private lazy var configuredMusicNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.red
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
}
