//
//  UIImageView.swift
//  Chatter
//
//  Created by Nick Kurochkin on 07.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

extension UIImage {
    static func resize(image: UIImage?, targetSize: CGSize) -> UIImage? {
        guard let image = image else {
            return nil
        }
        
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

