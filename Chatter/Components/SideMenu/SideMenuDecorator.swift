//
//  SideMenuDecorator.swift
//  Chatter
//
//  Created by Nick Kurochkin on 03.03.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit


enum SideMenuState {
    case menu
    case controller
}

protocol SideMenuDelegate {
    func togglePanel()
    func collapsePanel()
}

class SideMenuDecorator {
    private var controller: SideMenu!
    
    private var itemViewFullSize: CGSize { return controller.view.frame.size }
    private var itemViewMediumSize: CGSize {
        let height = itemViewFullSize.height - 200
        return CGSize(width: itemViewFullSize.width * height/itemViewFullSize.height, height: height)
    }
    private var itemViewSmallSize: CGSize {
        return CGSize(width: itemViewMediumSize.width*0.858, height: itemViewMediumSize.height*0.858)
    }
    
    private var itemListHeight: CGFloat {
        get {
            let maxListHeight = controller.view.frame.height - 200
            let listHeight = CGFloat(controller.items.count * 52)
            return listHeight > maxListHeight ? maxListHeight : listHeight
        }
    }
    
    private var controllerRadius: CGFloat = 20
    
    private var menuState: SideMenuState = .menu
    
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
    //    private var itemListCells:
    
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
}

//  MARK:- setup
extension SideMenuDecorator {
    private func setupData() {
        for (index, item) in controller.items.enumerated() {
            let itemView = SideMenuItemCell()
            itemView.tag = index
            itemView.setData(item: item)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didSelectMenuItemView))
            itemView.addGestureRecognizer(gesture)
            
            itemList.addArrangedSubview(itemView)
            itemList.addConstraints([
                itemView.heightAnchor.constraint(equalToConstant: 52),
                itemView.leadingAnchor.constraint(equalTo: itemList.leadingAnchor),
                itemView.trailingAnchor.constraint(equalTo: itemList.trailingAnchor),
            ])
            
            item.viewController.view.tag = index
            item.viewController.view.frame = CGRect(x: itemViewFullSize.width, y: 0, width: itemViewFullSize.width, height: itemViewFullSize.height)
            item.viewController.view.clipsToBounds = true
            item.viewController.view.layer.cornerRadius = controllerRadius
            controller.view.addSubview(item.viewController.view)
            controller.addChild(item.viewController)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectControllerView(_:)))
            let slideGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(slideController(_:)))
            
            item.viewController.view.addGestureRecognizer(tapGesture)
            item.viewController.view.addGestureRecognizer(slideGestureRecognizer)
        }
    }
    
    private func setupViews() {
        topView.addSubview(profileLogo)
        topView.addSubview(profileName)
        topView.addSubview(profileStatus)
        controller.view.addSubview(topView)
        
        controller.view.addSubview(itemList)
        
        controller.view.addSubview(bottomView)
    }
    
    private func setupConstraints() {
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
        controller.view.addConstraints([
            itemList.heightAnchor.constraint(equalToConstant: itemListHeight),
            itemList.centerYAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.centerYAnchor),
            itemList.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
            itemList.widthAnchor.constraint(equalTo: controller.view.widthAnchor, multiplier: 0.615)
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

//  MARK:- menu drawing functions
extension SideMenuDecorator {
    @objc func didSelectMenuItemView(_ gestureRecognizer: UIGestureRecognizer) {
        guard let index = gestureRecognizer.view?.tag, index >= 0 && index < controller.items.count else { return }
        
        controller.selectItem(index: index)
    }
    
    func drawMenu(for path: SideMenuPath) {
        guard validPath(path: path) else { return }
        
//        setGestureRecognizers(for: path)
        UIView.animate(withDuration: 0.5, delay: 0.1,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
                        for (index, item) in self.controller.items.enumerated() {
                            guard index != path.previousIndex && index != path.selectedIndex else { continue }
                            let y = (self.itemViewFullSize.height - self.itemViewSmallSize.height)/2
                            item.viewController.view.frame = CGRect(x: self.itemViewFullSize.width, y: y, width: self.itemViewSmallSize.width, height: self.itemViewSmallSize.height)
                            
                            item.viewController.view.alpha = 0
                        }
                        
                        if let previousIndex = path.previousIndex {
                            let x = self.itemViewFullSize.width * 0.615
                            let y = (self.itemViewFullSize.height - self.itemViewSmallSize.height)/2
                            self.controller.items[previousIndex].viewController.view.frame = CGRect(x: x, y: y, width: self.itemViewSmallSize.width, height: self.itemViewSmallSize.height)
                            self.controller.items[previousIndex].viewController.view.alpha = 0.5
                        }
                        
                        if let selectedIndex = path.selectedIndex {
                            let x = self.itemViewFullSize.width * 0.69
                            let y = (self.itemViewFullSize.height - self.itemViewMediumSize.height)/2
                            self.controller.items[selectedIndex].viewController.view.frame = CGRect(x: x, y: y, width: self.itemViewMediumSize.width, height: self.itemViewMediumSize.height)
                             self.controller.view.bringSubviewToFront(self.controller.items[selectedIndex].viewController.view)
                            self.controller.items[selectedIndex].viewController.view.alpha = 1
                        }
                        
                        self.drawItemList()
        }, completion: nil)
    }
    
    private func drawItemList() {
        for (index, item) in self.itemList.subviews.enumerated() {
            guard let view = item as? SideMenuItemCell else { continue }
            view.select(index == controller.path.selectedIndex)
        }
    }
    
    private func validPath(path: SideMenuPath) -> Bool {
        return (path.previousIndex == nil || (path.previousIndex! >= 0 && path.previousIndex! < controller.items.count)) &&
            (path.selectedIndex == nil || (path.selectedIndex! >= 0 && path.selectedIndex! < controller.items.count))
    }
}


//  MARK:- controller drawing functions
extension SideMenuDecorator {
    @objc func didSelectControllerView(_ gestureRecognizer: UIGestureRecognizer) {
        guard let index = gestureRecognizer.view?.tag, index == controller.path.selectedIndex else { return }
        expandController()
    }
    
    @objc func slideController(_ recognizer: UIPanGestureRecognizer) {
        guard let index = recognizer.view?.tag, index == controller.path.selectedIndex else { return }
        
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: self.controller.view).x > 0)
        
        switch recognizer.state {
        case .began:
            if !gestureIsDraggingFromLeftToRight && menuState == .controller { return }
            else if gestureIsDraggingFromLeftToRight && menuState == .menu { return }
        case .changed:
            guard let rview = recognizer.view else { return }
            let tapX = recognizer.translation(in: controller.view).x / 8
            
            let newHeight =  rview.frame.height - tapX
            let newWidth = rview.frame.width * newHeight/rview.frame.height
            
            let newX = (rview.center.x + tapX) - newWidth/2
            let newY = controller.view.center.y - newHeight/2
            
            if newX < 0 {
                self.expandController()
                return
            }
            if newX > (self.itemViewFullSize.width * 0.69) {
                self.collapseController()
                return
            }
            
            rview.frame = CGRect(
                x: newX,
                y: newY,
                width: newWidth,
                height: newHeight)
            
            rview.layer.cornerRadius = newX/(self.itemViewFullSize.width * 0.69) * controllerRadius
        case .ended:
            if let rview = recognizer.view {
                if menuState == .controller {
                    if rview.frame.minX > self.controller.view.frame.width/4 {
                        self.collapseController()
                    } else {
                        self.expandController()
                    }
                } else {
                    if rview.frame.minX < self.controller.view.frame.width/2 {
                        self.expandController()
                    } else {
                        self.collapseController()
                    }
                }
            }
        default:
            break
        }
    }
    
    private func expandController() {
        guard let index = controller.path.selectedIndex else { return }
        
        UIView.animate(withDuration: 0.5, delay: 0.1,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
                        self.controller.items[index].viewController.view.frame = CGRect(x: 0, y: 0, width: self.itemViewFullSize.width, height: self.itemViewFullSize.height)
                        self.controller.items[index].viewController.view.layer.cornerRadius = 0
        }, completion: { _ in
            self.menuState = .controller
        })
    }
    
    private func collapseController() {
        guard let index = controller.path.selectedIndex else { return }
        
        UIView.animate(withDuration: 0.5, delay: 0.1,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
                        let x = self.itemViewFullSize.width * 0.69
                        let y = (self.itemViewFullSize.height - self.itemViewMediumSize.height)/2
                        self.controller.items[index].viewController.view.frame = CGRect(x: x, y: y, width: self.itemViewMediumSize.width, height: self.itemViewMediumSize.height)
                        self.controller.items[index].viewController.view.layer.cornerRadius = self.controllerRadius
        }, completion: { _ in
            self.menuState = .menu
        })
    }
}
