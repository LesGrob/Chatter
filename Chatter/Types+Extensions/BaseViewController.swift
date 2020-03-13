//
//  BaseViewController.swift
//  Chatter
//
//  Created by Nick Kurochkin on 29.01.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit
import FloatingSideMenu

class BaseViewController: SideMenuItemController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.Default.whiteGray
    }
}
