//
//  DesignPattern.swift
//  Chatter
//
//  Created by Nick Kurochkin on 29.01.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

protocol PatternViewController {
    var interpreter: Interpreter! { get set }
}

class Interpreter {
    var presenter: Presenter!
    var dataSource: DataSource!
    
    init(presenter: Presenter, dataSource: DataSource) {
        self.presenter = presenter
        self.dataSource = dataSource
    }
}

class Presenter {
    var controller: UIViewController!
    var dataSource: DataSource!
    
    init(controller: UIViewController, dataSource: DataSource) {
        self.controller = controller
        self.dataSource = dataSource
    }
}

class DataSource {
    
}
