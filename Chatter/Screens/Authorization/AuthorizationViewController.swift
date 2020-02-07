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
    
    var pager: PagerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataSource = AuthorizationDataSource()
        let presenter = AuthorizationPresenter(controller: self, dataSource: dataSource)
        self.interpreter = AuthorizationInterpreter(presenter: presenter, dataSource: presenter.dataSource)
        
        self.configureViews()
    }
    
    func configureViews() {
        let page1 = PageObject(label: "start", view: AuthorizationPageStart(changePage: changePage))
        let page2 = PageObject(label: "number", view: AuthorizationPageNumber(changePage: changePage))
        let page3 = PageObject(label: "verify", view: AuthorizationPageVerify(changePage: changePage))
        let page4 = PageObject(label: "details", view: AuthorizationPageDetails(changePage: changePage))
        
        self.pager = PagerView(pages: [page1, page2, page3, page4])
        self.pager.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pager)
        
        pager.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pager.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pager.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pager.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    }
    
    func changePage() -> Void{
        var page = self.pager.getCurrentPage + 1
        if page > (self.pager.getPages.count - 1) {
            page = 0
        }
        self.pager.set(page: page, completion: {})
    }
}

extension AuthorizationViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
