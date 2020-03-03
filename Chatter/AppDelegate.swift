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
        
        
        let view1 = UIViewController()
        view1.view.backgroundColor = .systemPink
        let item1 = SideMenuItem(icon: UIImage(named: "ic_rounded_plus"), title: "Adoption", viewController: view1)
        
        let view2 = UIViewController()
        view2.view.backgroundColor = .systemPink
        let item2 = SideMenuItem(icon: UIImage(named: "ic_rounded_plus"), title: "Danation", viewController: view2)
        
        
        let contr = SideMenu(items: [item1, item2])//AuthorizationViewController()
        
        window?.rootViewController = contr
        window!.makeKeyAndVisible()
        
        return true
    }
}

