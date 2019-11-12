//
//  AppDelegate.swift
//  ListTest
//
//  Created by Kanz on 11/11/2019.
//  Copyright © 2019 KanzDevelop. All rights reserved.
//

import UIKit

import SwiftyBeaver
let log = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = MainViewController(reactor: MainViewReactor())
        let nav = UINavigationController(rootViewController: vc)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
}

