//
//  CatsListViewController.swift
//  Chatter
//
//  Created by Nick Kurochkin on 12.03.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit
import FloatingSideMenu

class CatsListViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let catImage = UIImageView(frame: CGRect(x: 40, y: 40, width: 200, height: 200))
        catImage.image = UIImage(named: "profile_template")
        catImage.backgroundColor = .blue
        catImage.contentMode = .scaleAspectFit
        
        view.addSubview(catImage)
        //        view.addConstraints([
        //            catImage.widthAnchor.constraint(equalToConstant: 200),
        //            catImage.heightAnchor.constraint(equalToConstant: 200),
        //            catImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
        //            catImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //        ])
    }
}
