//
//  AppDelegate.swift
//  Chatter
//
//  Created by Nick Kurochkin on 29.01.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        let view1 = SideMenuItemController()
        view1.view.backgroundColor = .blue
        let item1 = SideMenuItem(icon: UIImage(named: "ic_rounded_plus"), title: "blue", viewController: view1)
        
        let view2 = SideMenuItemController()
        view2.view.backgroundColor = .green
        let item2 = SideMenuItem(icon: UIImage(named: "ic_rounded_plus"), title: "green", viewController: view2)
        
        let view3 = SideMenuItemController()
        view3.view.backgroundColor = .yellow
        let item3 = SideMenuItem(icon: UIImage(named: "ic_rounded_plus"), title: "yellow", viewController: view3)
        
        let view4 = SideMenuItemController()
        view4.view.backgroundColor = .cyan
        let item4 = SideMenuItem(icon: UIImage(named: "ic_rounded_plus"), title: "cyan", viewController: view4)
        
        
        let contr = SideMenu(items: [item1, item2, item3, item4])//AuthorizationViewController()
        
        window?.rootViewController = contr
        window!.makeKeyAndVisible()
        
        return true
    }
}

