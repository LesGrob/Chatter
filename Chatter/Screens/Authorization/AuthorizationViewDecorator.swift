//
//  AuthorizationViewDecorator.swift
//  Chatter
//
//  Created by Nick Kurochkin on 03.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class AuthorizationViewDecorator {
    
    var changePage: () -> Void
    
    let page1: UIView = UIView()
    let page2: UIView = UIView()
    let page3: UIView = UIView()
    let page4: UIView = UIView()
    
    init(chagePage action: @escaping () -> Void){
        self.changePage = action
        self.setupView()
    }
    
    private func setupView(){
        setupView1()
        setupView2()
        setupView3()
        setupView4()
    }
    
    @objc func changePageTap(_ gesture: UIGestureRecognizer){
       changePage()
    }
}

extension AuthorizationViewDecorator {
    private func setupView1() {
        let input = PhoneInput(frame: .zero)
        page1.addSubview(input)
        input.translatesAutoresizingMaskIntoConstraints = false
        input.leadingAnchor.constraint(equalTo: page1.leadingAnchor, constant: 24).isActive = true
        input.trailingAnchor.constraint(equalTo: page1.trailingAnchor, constant: -24).isActive = true
        input.centerYAnchor.constraint(equalTo: page1.centerYAnchor).isActive = true
        
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GET STARTED", for: .normal)
        button.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        page1.addSubview(button)

        button.leadingAnchor.constraint(equalTo: page1.leadingAnchor, constant: 24).isActive = true
        button.trailingAnchor.constraint(equalTo: page1.trailingAnchor, constant: -24).isActive = true
        button.bottomAnchor.constraint(equalTo: page1.safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//
//        let subtitle = UILabel()
//        subtitle.font = .customFont(ofSize: 18, weight: .medium)
//        subtitle.textColor = UIColor.Default.darkGray
//        subtitle.textAlignment = .center
//        subtitle.numberOfLines = 2
//        subtitle.text = "we will make shure to make you satisfied"
//        subtitle.translatesAutoresizingMaskIntoConstraints = false
//        page1.addSubview(subtitle)
//
//        subtitle.bottomAnchor.constraint(lessThanOrEqualTo: button.topAnchor, constant: -24) .isActive = true
//        subtitle.centerXAnchor.constraint(equalTo: page1.centerXAnchor).isActive = true
//        subtitle.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        subtitle.heightAnchor.constraint(equalToConstant: 44).isActive = true
//
//
//        let title = UILabel()
//        title.font = .customFont(ofSize: 34, weight: .medium)
//        title.textColor = .black
//        title.textAlignment = .center
//        title.translatesAutoresizingMaskIntoConstraints = false
//        title.text = "welcome"
//        page1.addSubview(title)
//
//        title.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: -10).isActive = true
//        title.leadingAnchor.constraint(equalTo: page1.leadingAnchor).isActive = true
//        title.trailingAnchor.constraint(equalTo: page1.trailingAnchor).isActive = true
//        title.heightAnchor.constraint(equalToConstant: 34).isActive = true
//
//
//        let image = UIImageView(image: UIImage(named: "auth_image1"))
//        image.contentMode = .scaleToFill
//        image.translatesAutoresizingMaskIntoConstraints = false
//        page1.addSubview(image)
//
//        image.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -24).isActive = true
//        image.topAnchor.constraint(equalTo: page1.topAnchor).isActive = true
//        image.leadingAnchor.constraint(equalTo: page1.leadingAnchor).isActive = true
//        image.trailingAnchor.constraint(equalTo: page1.trailingAnchor).isActive = true
//        image.heightAnchor.constraint(lessThanOrEqualTo: image.widthAnchor).isActive = true
    }
    
    private func setupView2() {
        let terms = UILabel()
        terms.font = .customFont(ofSize: 14, weight: .light)
        terms.textColor = .lightGray
        terms.textAlignment = .center
        terms.numberOfLines = 2
        terms.text = "By confirming, you indicating that you agree to the Privacy Police and Terms."
        terms.translatesAutoresizingMaskIntoConstraints = false
        page2.addSubview(terms)
        
        terms.bottomAnchor.constraint(equalTo: page2.safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
        terms.leadingAnchor.constraint(equalTo: page2.leadingAnchor, constant: 24).isActive = true
        terms.trailingAnchor.constraint(equalTo: page2.trailingAnchor, constant: -24).isActive = true
        terms.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        page2.addSubview(button)
        
        button.bottomAnchor.constraint(equalTo: terms.topAnchor, constant: -24).isActive = true
        button.leadingAnchor.constraint(equalTo: page2.leadingAnchor, constant: 24).isActive = true
        button.trailingAnchor.constraint(equalTo: page2.trailingAnchor, constant: -24).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        let subtitle = UILabel()
        subtitle.font = .customFont(ofSize: 18, weight: .light)
        subtitle.textColor = .black
        subtitle.textAlignment = .center
        subtitle.text = "Please Enter Your Mobile Phone"
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        page2.addSubview(subtitle)
        
        subtitle.bottomAnchor.constraint(lessThanOrEqualTo: button.topAnchor, constant: -24).isActive = true
        subtitle.leadingAnchor.constraint(equalTo: page2.leadingAnchor, constant: 24).isActive = true
        subtitle.trailingAnchor.constraint(equalTo: page2.trailingAnchor, constant: -24).isActive = true
        subtitle.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        
        let image = UIImageView(image: UIImage(named: "auth_image2"))
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        page2.addSubview(image)
        
        image.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: -24).isActive = true
        image.topAnchor.constraint(equalTo: page2.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: page2.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: page2.trailingAnchor).isActive = true
        image.heightAnchor.constraint(lessThanOrEqualTo: image.widthAnchor).isActive = true
    }
    
    private func setupView3() {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("VERIFY", for: .normal)
        button.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        page3.addSubview(button)

        button.leadingAnchor.constraint(equalTo: page3.leadingAnchor, constant: 24).isActive = true
        button.trailingAnchor.constraint(equalTo: page3.trailingAnchor, constant: -24).isActive = true
        button.bottomAnchor.constraint(equalTo: page3.safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true


        let subtitle = UILabel()
        subtitle.font = .customFont(ofSize: 18, weight: .light)
        subtitle.textColor = UIColor.Default.darkGray
        subtitle.textAlignment = .center
        subtitle.text = "Please Enter Your Verification Code"
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        page3.addSubview(subtitle)

        subtitle.bottomAnchor.constraint(lessThanOrEqualTo: button.topAnchor, constant: -24).isActive = true
        subtitle.leadingAnchor.constraint(equalTo: page3.leadingAnchor, constant: 24).isActive = true
        subtitle.trailingAnchor.constraint(equalTo: page3.trailingAnchor, constant: -24).isActive = true
        subtitle.heightAnchor.constraint(equalToConstant: 18).isActive = true


        let image = UIImageView(image: UIImage(named: "auth_image3"))
        image.translatesAutoresizingMaskIntoConstraints = false
        page3.addSubview(image)

        image.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: -24).isActive = true
        image.topAnchor.constraint(equalTo: page3.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: page3.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: page3.trailingAnchor).isActive = true
        image.heightAnchor.constraint(lessThanOrEqualTo: image.widthAnchor).isActive = true
    }

    private func setupView4() {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SAVE", for: .normal)
        button.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        page4.addSubview(button)
        
        button.leadingAnchor.constraint(equalTo: page4.leadingAnchor, constant: 24).isActive = true
        button.trailingAnchor.constraint(equalTo: page4.trailingAnchor, constant: -24).isActive = true
        button.centerYAnchor.constraint(equalTo: page4.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
