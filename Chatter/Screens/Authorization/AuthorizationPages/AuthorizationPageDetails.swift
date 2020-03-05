//
//  AuthorizationPageDetails.swift
//  Chatter
//
//  Created by Nick Kurochkin on 07.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class AuthorizationPageDetails: AuthorizationViewPage {
    
    private var loadImageButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "ic_rounded_plus")
        view.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        view.tintColor = UIColor.Default.lightBlue
        view.backgroundColor = UIColor.Default.whiteGray
        view.layer.cornerRadius = 20
//        view.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        return view
    }()

    
    private var profileImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "auth_image3")
        view.layer.borderWidth = 4
        view.layer.borderColor = UIColor.Default.lightBlue.cgColor
        view.layer.cornerRadius = 60
        view.layer.masksToBounds = true
        return view
    }()
    private var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Let people See Your Beautiful Face"
        view.font = .customFont(ofSize: 16, weight: .medium)
        view.textColor = UIColor.Default.black
        view.textAlignment = .center
        return view
    }()
    
    private var nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Placeholder"
        view.font = .customFont(ofSize: 14, weight: .light)
        view.textColor = UIColor.Default.black
        return view
    }()
    private var nameTextField: CustomTextField = {
        let view = CustomTextField()
        view.placeholder = "Nickname"
        view.characterCountMax = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var biographyLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Biography"
        view.font = .customFont(ofSize: 14, weight: .light)
        view.textColor = UIColor.Default.black
        return view
    }()
    private var biographyTextView: CustomTextView = {
        let view = CustomTextView()
        view.placeholder = "Biography"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var button: RoundedButton = {
        let view = RoundedButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("SAVE", for: .normal)
        view.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        return view
    }()

    
    override func setupView() {
        addSubview(profileImage)
        addSubview(loadImageButton)
        addSubview(descriptionLabel)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(biographyLabel)
        addSubview(biographyTextView)
        addSubview(button)

        addConstraints([
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 120),
            profileImage.widthAnchor.constraint(equalToConstant: 120),
        ])
        addConstraints([
            loadImageButton.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 2),
            loadImageButton.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 2),
            loadImageButton.heightAnchor.constraint(equalToConstant: 40),
            loadImageButton.widthAnchor.constraint(equalToConstant: 40),
        ])
        addConstraints([
            descriptionLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
        
        addConstraints([
            nameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 36),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
        addConstraints([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
        
        addConstraints([
            biographyLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 24),
            biographyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            biographyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
        addConstraints([
            biographyTextView.topAnchor.constraint(equalTo: biographyLabel.bottomAnchor, constant: 4),
            biographyTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            biographyTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            biographyTextView.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
            biographyTextView.bottomAnchor.constraint(lessThanOrEqualTo: button.topAnchor, constant: -24),
        ])
        
        addConstraints([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func changePageTap(_ gesture: UIGestureRecognizer){
       changePage?()
    }
}



