//
//  Colors.swift
//  Chatter
//
//  Created by Nick Kurochkin on 29.01.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

extension UIColor {
    struct Default {
        static let whiteGray = UIColor(rgb: 0xF7F7F7)
        static let lightGray = UIColor(rgb: 0xAFBDCE)
        static let darkGray = UIColor(rgb: 0x72839B)
        
        static let grayBlue = UIColor(rgb: 0x364D6B)
        static let darkBlue = UIColor(rgb: 0x266DD3)
        static let lightBlue = UIColor(rgb: 0x03BEFF)
    }
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}
