//
//  AppDelegate.swift
//  Chatter
//
//  Created by Nick Kurochkin on 29.01.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit
import FloatingSideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = setupSideMenu()
        window!.makeKeyAndVisible()
        
        return true
    }
    
    func setupSideMenu() -> SideMenu {
        let view1 = CatsListViewController()
        let item1 = SideMenuItem(icon: UIImage(named: "ic_rounded_plus"), title: "blue", viewController: view1)
        
        let view2 = SideMenuItemController()
        view2.view.backgroundColor = .green
        let item2 = SideMenuItem(icon: nil, title: "green", viewController: view2)
        
        let view3 = SideMenuItemController()
        view3.view.backgroundColor = .yellow
        let item3 = SideMenuItem(icon: UIImage(named: "ic_rounded_plus"), title: "yellow", viewController: view3)
        
        let view4 = SideMenuItemController()
        view4.view.backgroundColor = .cyan
        let item4 = SideMenuItem(icon: nil, title: "cyan", viewController: view4)
        
        let profile = ProfileMenuViewController()
        
        let menu = SideMenu(items: [item1, item2, item3, item4])//AuthorizationViewController()
        
        menu.view.backgroundColor = UIColor(rgb: 0x3B6060)
        menu.topView = profile.view
        menu.menuItemCellClass = CustomSideMenuItemCell.self
        
        return menu
    }
}
