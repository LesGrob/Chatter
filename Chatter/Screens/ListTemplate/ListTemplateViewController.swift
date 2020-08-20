//
//  CatsListViewController.swift
//  Chatter
//
//  Created by Nick Kurochkin on 12.03.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class ListTemplateViewController: BaseViewController {
    var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
        table.separatorStyle = .singleLine
        table.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
        view.addSubview(table)
        view.addConstraints([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
    }
}


extension ListTemplateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        cell.selectionStyle = .none
        
        let catImage = UIImageView(image: UIImage(named: "profile_template"))
        catImage.translatesAutoresizingMaskIntoConstraints = false
        
        catImage.contentMode = .scaleAspectFit
        catImage.backgroundColor = .gray
        catImage.clipsToBounds = true
        catImage.layer.cornerRadius = 6
        
        cell.addSubview(catImage)
        cell.addConstraints([
            catImage.topAnchor.constraint(equalTo: cell.topAnchor, constant: 4),
            catImage.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -4),
            catImage.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 12),
            catImage.widthAnchor.constraint(equalTo: catImage.heightAnchor)
        ])
        
        let indexLabel = UILabel()
        indexLabel.translatesAutoresizingMaskIntoConstraints = false
        indexLabel.textColor = .black
        indexLabel.font = .customFont(ofSize: 16, weight: .medium)
        indexLabel.text = "\(indexPath.row)"
        cell.addSubview(indexLabel)
        cell.addConstraints([
            indexLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            indexLabel.leadingAnchor.constraint(equalTo: catImage.trailingAnchor, constant: 10),
            indexLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant:  -10)
        ])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 * self.absoluteProportion
    }
}
