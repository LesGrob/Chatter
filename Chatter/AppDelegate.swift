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
        let view1 = ViewsTemplateViewController()
        let item1 = SideMenuItem(icon: nil, title: "Views Template", viewController: view1)
        
        let view2 = ConstraintTemplateViewController()
        let item2 = SideMenuItem(icon: UIImage(named: "ic_apps"), title: "Constraint template", viewController: view2)
        
        let view3 = ListTemplateViewController()
        let item3 = SideMenuItem(icon: UIImage(named: "ic_side_menu"), title: "List page", viewController: view3)
        
        let topView = ProfileMenuViewController()
        let bottomView = ProfileMenuViewController()
        
        let menu = SideMenu(items: [item1, item2, item3])
        
        menu.view.backgroundColor = UIColor(rgb: 0x3B6060)
        menu.topView = topView.view
        menu.bottomView = bottomView.view
//        menu.disableViewIteraction = false
//        menu.menuItemCellClass = CustomSideMenuItemCell.self
        
        return menu
    }
}

class ViewsTemplateViewController: SideMenuItemController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        let blueView = UIView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        blueView.backgroundColor = .blue
        
        let yellowView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        yellowView.backgroundColor = .yellow
        
        view.addSubview(blueView)
        blueView.addSubview(yellowView)
    }
}


class ConstraintTemplateViewController: SideMenuItemController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)

        let grayView = UIView()
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.backgroundColor = .gray
        view.addSubview(grayView)
        grayView.addConstraints([
            grayView.heightAnchor.constraint(equalToConstant: 50),
            grayView.widthAnchor.constraint(equalToConstant: 50),
        ])
        view.addConstraints([
            grayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            grayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
        ])
    }
}
