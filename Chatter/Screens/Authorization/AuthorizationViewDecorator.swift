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
    private func setupView1(){
        let image = UIImageView(image: UIImage(named: "auth_image1"))
        image.translatesAutoresizingMaskIntoConstraints = false
        page1.addSubview(image)
        
        image.topAnchor.constraint(equalTo: page1.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: page1.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: page1.trailingAnchor).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        
        
        
        let title = UILabel()
        title.font = .customFont(ofSize: 34, weight: .medium)
        title.textColor = .black
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "welcome"
        page1.addSubview(title)
        
        title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 32).isActive = true
        title.leadingAnchor.constraint(equalTo: page1.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: page1.trailingAnchor).isActive = true
        
        
        
        let subtitle = UILabel()
        subtitle.font = .customFont(ofSize: 18, weight: .medium)
        subtitle.textColor = UIColor.Default.darkGray
        subtitle.textAlignment = .center
        subtitle.numberOfLines = 2
        subtitle.text = "we will make shure to make you satisfied"
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        page1.addSubview(subtitle)
        
        subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        subtitle.centerXAnchor.constraint(equalTo: page1.centerXAnchor).isActive = true
        subtitle.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.Default.lightBlue
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .customFont(ofSize: 18, weight: .medium)
        button.setTitle("GET STARTED", for: .normal)
        button.dropShadow(shadow: .materialShadow05)
        button.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        page1.addSubview(button)
        
        button.leadingAnchor.constraint(equalTo: page1.leadingAnchor, constant: 24).isActive = true
        button.trailingAnchor.constraint(equalTo: page1.trailingAnchor, constant: -24).isActive = true
        button.bottomAnchor.constraint(equalTo: page1.bottomAnchor, constant: -54).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupView2(){
        let image = UIImageView(image: UIImage(named: "auth_image2"))
        image.translatesAutoresizingMaskIntoConstraints = false
        page2.addSubview(image)
        
        image.topAnchor.constraint(equalTo: page2.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: page2.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: page2.trailingAnchor).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        
        
        let subtitle = UILabel()
        subtitle.font = .customFont(ofSize: 18, weight: .light)
        subtitle.textColor = .black
        subtitle.textAlignment = .center
        subtitle.text = "Please Enter Your Mobile Phone"
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        page2.addSubview(subtitle)
        
        subtitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 32).isActive = true
        subtitle.leadingAnchor.constraint(equalTo: page2.leadingAnchor, constant: 24).isActive = true
        subtitle.trailingAnchor.constraint(equalTo: page2.trailingAnchor, constant: -24).isActive = true
        
        
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.Default.lightBlue
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .customFont(ofSize: 18, weight: .medium)
        button.setTitle("NEXT", for: .normal)
        button.dropShadow(shadow: .materialShadow05)
        button.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        page2.addSubview(button)
        
        button.leadingAnchor.constraint(equalTo: page2.leadingAnchor, constant: 24).isActive = true
        button.trailingAnchor.constraint(equalTo: page2.trailingAnchor, constant: -24).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let terms = UILabel()
        terms.font = .customFont(ofSize: 14, weight: .light)
        terms.textColor = .lightGray
        terms.textAlignment = .center
        terms.numberOfLines = 2
        terms.text = "By confirming, you indicating that you agree to the Privacy Police and Terms."
        terms.translatesAutoresizingMaskIntoConstraints = false
        page2.addSubview(terms)
        
        terms.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 24).isActive = true
        terms.bottomAnchor.constraint(equalTo: page2.bottomAnchor, constant: -34).isActive = true
        terms.leadingAnchor.constraint(equalTo: page2.leadingAnchor, constant: 24).isActive = true
        terms.trailingAnchor.constraint(equalTo: page2.trailingAnchor, constant: -24).isActive = true
    }
    
    private func setupView3(){
        let image = UIImageView(image: UIImage(named: "auth_image3"))
        image.translatesAutoresizingMaskIntoConstraints = false
        page3.addSubview(image)
        
        image.topAnchor.constraint(equalTo: page3.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: page3.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: page3.trailingAnchor).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        
        
        
        let title = UILabel()
        title.font = .customFont(ofSize: 34, weight: .medium)
        title.textColor = .black
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "welcome"
        page3.addSubview(title)
        
        title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 32).isActive = true
        title.leadingAnchor.constraint(equalTo: page3.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: page3.trailingAnchor).isActive = true
        
        
        
        let subtitle = UILabel()
        subtitle.font = .customFont(ofSize: 18, weight: .light)
        subtitle.textColor = UIColor.Default.darkGray
        subtitle.textAlignment = .center
        subtitle.numberOfLines = 2
        subtitle.text = "we will make shure to make you satisfied"
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        page3.addSubview(subtitle)
        
        subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        subtitle.centerXAnchor.constraint(equalTo: page3.centerXAnchor).isActive = true
        subtitle.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.Default.lightBlue
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .customFont(ofSize: 18, weight: .medium)
        button.setTitle("GET STARTED", for: .normal)
        button.dropShadow(shadow: .materialShadow05)
        button.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        page3.addSubview(button)
        
        button.leadingAnchor.constraint(equalTo: page3.leadingAnchor, constant: 24).isActive = true
        button.trailingAnchor.constraint(equalTo: page3.trailingAnchor, constant: -24).isActive = true
        button.bottomAnchor.constraint(equalTo: page3.bottomAnchor, constant: -54).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setupView4(){
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.Default.lightBlue
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .customFont(ofSize: 18, weight: .medium)
        button.setTitle("GET STARTED", for: .normal)
        button.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        page4.addSubview(button)
        
        button.leadingAnchor.constraint(equalTo: page4.leadingAnchor, constant: 24).isActive = true
        button.trailingAnchor.constraint(equalTo: page4.trailingAnchor, constant: -24).isActive = true
        button.centerYAnchor.constraint(equalTo: page4.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}
