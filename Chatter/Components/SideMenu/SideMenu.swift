//
//  SideMenu.swift
//  Chatter
//
//  Created by Nick Kurochkin on 03.03.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class SideMenu: UIViewController {
    private var menuItems: [SideMenuItem] = []
    var items: [SideMenuItem] { get { return menuItems } }
    
    private var menuPath: SideMenuPath = SideMenuPath()
    var path: SideMenuPath { get { return self.menuPath } }
    
    private var decorator: SideMenuDecorator!
    
    init(items: [SideMenuItem]) {
        super.init(nibName: nil, bundle: nil)
        self.menuItems = items
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorator = SideMenuDecorator(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectItem(index: 0)
    }
    
    public func selectItem(index: Int) {
        guard index >= 0, index < menuItems.count, index != menuPath.selectedIndex else { return }
        
        menuPath.previousIndex = path.selectedIndex
        menuPath.selectedIndex = index
        
        decorator.drawMenu(for: menuPath)
    }
}
