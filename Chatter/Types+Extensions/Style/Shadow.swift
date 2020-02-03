//
//  Shadow.swift
//  Chatter
//
//  Created by Nick Kurochkin on 29.01.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class Shadow {
    var color: UIColor
    var opacity: Float
    var offSet: CGSize
    var radius: CGFloat
    var scale: Bool
    
    init(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.color = color
        self.opacity = opacity
        self.offSet = offSet
        self.radius = radius
        self.scale = scale
    }
    
    static let materialShadow05 = Shadow(color: .black, opacity: 0.3, offSet: CGSize(width: 0, height: 2), radius: 3.0)
    static let materialShadow15 = Shadow(color: .black, opacity: 0.15, offSet: CGSize(width: 0, height: 0), radius: 25, scale: true)
    
    static let shadowTop = Shadow(color: .black, opacity: 0.14, offSet: CGSize(width: 0, height: -5), radius: 4)
    static let shadowBottom = Shadow(color: .black, opacity: 0.14, offSet: CGSize(width: 0, height: 8), radius: 6)
}

extension UIView {
    func dropShadow(shadow: Shadow) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadow.color.cgColor
        self.layer.shadowOffset = shadow.offSet
        self.layer.shadowRadius = shadow.radius
        self.layer.shadowOpacity = shadow.opacity
    }
}
