//
//  String.swift
//  Chatter
//
//  Created by Nick Kurochkin on 30.01.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

extension String {
    func boundingRect(width: CGFloat = .greatestFiniteMagnitude,
                      height: CGFloat = .greatestFiniteMagnitude,
                      options: NSStringDrawingOptions = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin),
                      font: UIFont,
                      countLine: Int = 0) -> CGRect {
        let height: CGFloat = countLine == 0 ? height : (font.lineHeight * CGFloat(countLine)).rounded(.up)

        return NSString(string: self).boundingRect(
            with: CGSize(width: width, height: height),
            options: options,
            attributes: [NSAttributedString.Key.font: font],
            context: nil)
    }
}
