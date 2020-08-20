//
//  ProfileMenuViewController.swift
//  Chatter
//
//  Created by Nick Kurochkin on 10.03.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class ProfileMenuViewController: UIViewController {
    var profileLogo: UIImageView! = {
        let view = UIImageView(image: UIImage(named: "profile_template"))
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var profileName: UILabel! = {
        let view = UILabel()
        view.font = .customFont(ofSize: 16, weight: .medium)
        view.textColor = UIColor(rgb: 0xE4F7F9)
        view.text = "User Name"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var profileStatus: UILabel! = {
        let view = UILabel()
        view.font = .customFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor(rgb: 0x87ABAA)
        view.text = "Active status"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        
        view.addSubview(profileLogo)
        view.addSubview(profileName)
        view.addSubview(profileStatus)
        
        view.addConstraints([
            profileLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            profileLogo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            profileLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            profileLogo.heightAnchor.constraint(equalToConstant: 40),
            profileLogo.widthAnchor.constraint(equalToConstant: 40),
        ])
        view.addConstraints([
            profileName.topAnchor.constraint(equalTo: profileLogo.topAnchor),
            profileName.leadingAnchor.constraint(equalTo: profileLogo.trailingAnchor, constant: 22),
            profileName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
        ])
        view.addConstraints([
            profileStatus.bottomAnchor.constraint(equalTo: profileLogo.bottomAnchor),
            profileStatus.leadingAnchor.constraint(equalTo: profileLogo.trailingAnchor, constant: 22),
            profileStatus.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
        ])
    }
}
