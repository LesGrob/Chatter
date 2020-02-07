//
//  AuthorizationPageVerify.swift
//  Chatter
//
//  Created by Nick Kurochkin on 07.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class AuthorizationPageVerify: AuthorizationViewPage {
    private var image: UIImageView = {
        let view = UIImageView(image: UIImage(named: "auth_image3"))
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var subtitle: UILabel = {
        let view = UILabel()
        view.font = .customFont(ofSize: 18, weight: .light)
        view.textColor = UIColor.Default.darkGray
        view.textAlignment = .center
        view.text = "Please Enter Your Verification Code"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var button: RoundedButton = {
        let view = RoundedButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("VERIFY", for: .normal)
        view.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        return view
    }()
    
    override func setupView() {
        addSubview(image)
        addSubview(subtitle)
        addSubview(button)
        
        addConstraints([
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
        addConstraints([
            subtitle.bottomAnchor.constraint(lessThanOrEqualTo: button.topAnchor, constant: -24),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            subtitle.heightAnchor.constraint(equalToConstant: 14),
        ])
        addConstraints([
            image.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: -24),
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.heightAnchor.constraint(lessThanOrEqualTo: image.widthAnchor)
        ])
    }
    
    @objc func changePageTap(_ gesture: UIGestureRecognizer){
       changePage?()
    }
}


