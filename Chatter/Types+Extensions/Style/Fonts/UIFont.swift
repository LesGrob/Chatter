//
//  UIFont.swift
//  Chatter
//
//  Created by Nick Kurochkin on 03.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

extension UIFont  {
    public class func customFont(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        var font: UIFont?
        switch weight {
        case .light:
            font = UIFont(name: "Montserrat-Light", size: fontSize)
        case .medium:
            font = UIFont(name: "Montserrat-Medium", size: fontSize)
        case .regular:
            font = UIFont(name: "Montserrat-Regular", size: fontSize)
        default:
            return .systemFont(ofSize: fontSize, weight: weight)
        }
        guard let customFont = font else {
            return .systemFont(ofSize: fontSize, weight: weight)
        }
        return customFont
    }
}
