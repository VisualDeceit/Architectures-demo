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
        
        let songMVP = SearchSongAssembly.build()
        songMVP.navigationItem.title = "Search in iTunes"
        songMVP.tabBarItem = UITabBarItem(title: "Song", image: UIImage(systemName: "music.quarternote.3"), tag: 1)
        
        let appNavVC = self.configuredAppNavigationController
        appNavVC.viewControllers = [appMVP]
        
        let songNavVC = self.configuredMusicNavigationController
        songNavVC.viewControllers = [songMVP]
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([appNavVC, songNavVC], animated: false)
        
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
