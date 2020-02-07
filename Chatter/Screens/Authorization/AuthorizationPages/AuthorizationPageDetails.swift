//
//  AuthorizationPageDetails.swift
//  Chatter
//
//  Created by Nick Kurochkin on 07.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class AuthorizationPageDetails: AuthorizationViewPage {
    private var button: RoundedButton = {
        let view = RoundedButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("SAVE", for: .normal)
        view.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        return view
    }()
    
    override func setupView() {
    
        addSubview(button)
        
        addConstraints([
            button.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -24),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func changePageTap(_ gesture: UIGestureRecognizer){
       changePage?()
    }
}



