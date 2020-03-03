//
//  SideMenuDecorator.swift
//  Chatter
//
//  Created by Nick Kurochkin on 03.03.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class SideMenuDecorator {
    private var controller: SideMenu!
    
//    MARK:- top view
    private var topView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var profileLogo: UIImageView = {
        let view = UIImageView(image: UIImage(named: "profile_template"))
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var profileName: UILabel = {
        let view = UILabel()
        view.font = .customFont(ofSize: 16, weight: .medium)
        view.textColor = UIColor(rgb: 0xE4F7F9)
        view.text = "Miroslava Savitskaya"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var profileStatus: UILabel = {
        let view = UILabel()
        view.font = .customFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor(rgb: 0x87ABAA)
        view.text = "Active status"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    MARK:- list of items
    private var itemList: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    MARK:- view controllers
    private var controllersView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //    MARK:- bottom view
    private var bottomView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    init(controller: SideMenu) {
        self.controller = controller
        self.controller.view.backgroundColor = UIColor(rgb: 0x3B6060)
        setupViews()
        setupConstraints()
        setupData()
    }
    
    private func setupData(){
        for item in controller.items {
            let itemView = SideMenuItemCell()
            itemView.setData(item: item)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            itemList.addArrangedSubview(itemView)
            itemList.addConstraints([
                itemView.heightAnchor.constraint(equalToConstant: 52),
                itemView.leadingAnchor.constraint(equalTo: itemList.leadingAnchor),
                itemView.trailingAnchor.constraint(equalTo: itemList.trailingAnchor),
            ])
        }
    }
    
    private func setupViews() {
        topView.addSubview(profileLogo)
        topView.addSubview(profileName)
        topView.addSubview(profileStatus)
        controller.view.addSubview(topView)
        
        controller.view.addSubview(itemList)
        
        controller.view.addSubview(controllersView)
        
        controller.view.addSubview(bottomView)
    }
    
    private func setupConstraints(){
        //top view
        controller.view.addConstraints([
            topView.topAnchor.constraint(equalTo: controller.view.topAnchor, constant: 40),
            topView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 10),
            topView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -10),
        ])
        topView.addConstraints([
            profileLogo.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
            profileLogo.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
            profileLogo.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            profileLogo.heightAnchor.constraint(equalToConstant: 40),
            profileLogo.widthAnchor.constraint(equalToConstant: 40),
        ])
        topView.addConstraints([
            profileName.topAnchor.constraint(equalTo: profileLogo.topAnchor),
            profileName.leadingAnchor.constraint(equalTo: profileLogo.trailingAnchor, constant: 22),
            profileName.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -12),
        ])
        topView.addConstraints([
            profileStatus.bottomAnchor.constraint(equalTo: profileLogo.bottomAnchor),
            profileStatus.leadingAnchor.constraint(equalTo: profileLogo.trailingAnchor, constant: 22),
            profileStatus.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -12),
        ])
        
        //stack view
        let maxListHeight = controller.view.frame.height - 200
        let listHeight = CGFloat(controller.items.count * 52)
        let itemListHeight: CGFloat = listHeight > maxListHeight ? maxListHeight : listHeight
        controller.view.addConstraints([
            itemList.heightAnchor.constraint(equalToConstant: itemListHeight),
            itemList.centerYAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.centerYAnchor),
            itemList.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
            itemList.widthAnchor.constraint(equalTo: controller.view.widthAnchor, multiplier: 0.6)
        ])
        
        //controllers view
        controller.view.addConstraints([
            controllersView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            controllersView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            controllersView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor),
            controllersView.leadingAnchor.constraint(equalTo: itemList.trailingAnchor)
        ])
        
        //bottom view
        controller.view.addConstraints([
            bottomView.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: -40),
            bottomView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 10),
            bottomView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -10),
            bottomView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

extension SideMenuDecorator {
    func drawControllers() {
        
    }
}
