//
//  AppDelegate.swift
//  Super App
//
//  Created by Adolfo Montilla on 18-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        window.rootViewController = UIViewController()
        
        window.makeKeyAndVisible()
        
        window.backgroundColor = .red
        
        self.window = window
        
        return true
    }


}

