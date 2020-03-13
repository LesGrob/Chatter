//
//  CustomSideMenuItemCell.swift
//  Chatter
//
//  Created by Nick Kurochkin on 10.03.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit
import FloatingSideMenu

class CustomSideMenuItemCell: UIView, SideMenuItemCellDelegate {
    var icon: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor(rgb: 0x87ABAA)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title: UILabel = {
        let view = UILabel()
        view.font = .customFont(ofSize: 16, weight: .regular)
        view.textColor = UIColor(rgb: 0x87ABAA)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(icon)
        self.addSubview(title)
        
        addConstraints([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.heightAnchor.constraint(equalToConstant: 22),
            icon.widthAnchor.constraint(equalToConstant: 22),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
        ])
        addConstraints([
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 25),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(item: SideMenuItem) {
        self.title.text = item.title
        self.icon.image = item.icon?.withRenderingMode(.alwaysTemplate)
    }
    
    func select(_ select: Bool) {
        icon.tintColor = select ? .red : UIColor(rgb: 0x87ABAA)
        title.textColor = select ? .red : UIColor(rgb: 0x87ABAA)
    }
    
    static func cellHeight(stackWidth: CGFloat) -> CGFloat {
        return 52
    }
}
