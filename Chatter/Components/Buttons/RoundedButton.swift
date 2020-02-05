//
//  RoundedButton.swift
//  Chatter
//
//  Created by Nick Kurochkin on 04.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.height = 50
        self.backgroundColor = UIColor.Default.lightBlue
        self.layer.cornerRadius = 25
        self.titleLabel?.font = .customFont(ofSize: 18, weight: .medium)
        self.dropShadow(shadow: .materialShadow05)
    }
}
