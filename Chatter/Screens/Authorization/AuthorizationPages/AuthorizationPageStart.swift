//
//  AuthorizationPageStart.swift
//  Chatter
//
//  Created by Nick Kurochkin on 07.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class AuthorizationPageStart: AuthorizationViewPage {
    private var image: UIImageView = {
        let view = UIImageView(image: UIImage(named: "auth_image1"))
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var title: UILabel = {
        let view = UILabel()
        view.font = .customFont(ofSize: 34, weight: .medium)
        view.textColor = .black
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "welcome"
        return view
    }()
    
    private var subtitle: UILabel = {
        let view = UILabel()
        view.font = .customFont(ofSize: 18, weight: .medium)
        view.textColor = UIColor.Default.darkGray
        view.textAlignment = .center
        view.numberOfLines = 2
        view.text = "we will make shure to make you satisfied"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var button: RoundedButton = {
        let view = RoundedButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("GET STARTED", for: .normal)
        view.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        return view
    }()
    
    override func setupView() {
        addSubview(button)
        addSubview(subtitle)
        addSubview(title)
        addSubview(image)
        
        addConstraints([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        addConstraints([
            subtitle.bottomAnchor.constraint(lessThanOrEqualTo: button.topAnchor, constant: -24),
            subtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitle.widthAnchor.constraint(equalToConstant: 300),
            subtitle.heightAnchor.constraint(equalToConstant: 44)
        ])
        addConstraints([
            title.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: -10),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.heightAnchor.constraint(equalToConstant: 34)
        ])
        addConstraints([
            image.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -24),
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
