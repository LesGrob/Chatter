//
//  AuthorizationViewController.swift
//  Chatter
//
//  Created by Nick Kurochkin on 29.01.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class AuthorizationViewController: BaseViewController {
    var interpreter: Interpreter!
    var decoder: AuthorizationViewDecorator!
    
    var stepper: PagerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataSource = AuthorizationDataSource()
        let presenter = AuthorizationPresenter(controller: self, dataSource: dataSource)
        self.interpreter = AuthorizationInterpreter(presenter: presenter, dataSource: presenter.dataSource)
        
        self.decoder = AuthorizationViewDecorator(chagePage: chagePage)
        
        self.configureViews()
    }
    
    func configureViews() {
        let page1 = PageObject(label: "start", view: decoder.page1)
        let page2 = PageObject(label: "number", view: decoder.page2)
        let page3 = PageObject(label: "verify", view: decoder.page3)
        let page4 = PageObject(label: "details", view: decoder.page4)
        
        self.stepper = PagerView(pages: [page1, page2, page3, page4])
        self.stepper.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stepper)
        
        stepper.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stepper.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stepper.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stepper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    }
    
    func chagePage() -> Void{
        var page = self.stepper.getCurrentPage + 1
        if page > (self.stepper.getPages.count - 1) {
            page = 0
        }
        self.stepper.set(page: page, completion: {})
    }
}
