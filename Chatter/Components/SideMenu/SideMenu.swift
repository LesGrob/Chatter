//
//  SideMenu.swift
//  Chatter
//
//  Created by Nick Kurochkin on 03.03.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class SideMenu: UIViewController {
    var menuItems: [SideMenuItem] = []
    var items: [SideMenuItem] { get { return menuItems } }
    
    private var selectedItem: Int? = nil
    private var previousItem: Int? = nil
    
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
    
    public func selectItem(index: Int) {
        guard index > 0, index < menuItems.count else { return }
        
        previousItem = selectedItem
        selectedItem = index
        
        decorator.drawControllers()
    }
}
