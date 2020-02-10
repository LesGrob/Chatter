//
//  AuthorizationPageNumber.swift
//  Chatter
//
//  Created by Nick Kurochkin on 07.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class AuthorizationPageNumber: AuthorizationViewPage {
    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var image: UIImageView = {
        let view = UIImageView(image: UIImage(named: "auth_image2"))
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var subtitle: UILabel = {
        let view = UILabel()
        view.font = .customFont(ofSize: 14, weight: .light)
        view.textColor = .black
        view.textAlignment = .center
        view.text = "Please Enter Your Mobile Phone"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var input: PhoneInput = {
        let view = PhoneInput(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var button: RoundedButton = {
        let view = RoundedButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("NEXT", for: .normal)
        view.addTarget(self, action: #selector(changePageTap(_:)), for: .touchUpInside)
        return view
    }()
    
    private var terms: UILabel = {
        let view = UILabel()
        view.font = .customFont(ofSize: 14, weight: .light)
        view.textColor = .lightGray
        view.textAlignment = .center
        view.numberOfLines = 2
        view.text = "By confirming, you indicating that you agree to the Privacy Police and Terms."
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupView() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.Default.whiteGray
        addSubview(tableView)
        addConstraints([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    @objc func changePageTap(_ gesture: UIGestureRecognizer){
        self.endEditing(true)
       changePage?()
    }
}

extension AuthorizationPageNumber: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.Default.whiteGray
        cell.selectionStyle = .none
        
        cell.addSubview(image)
        cell.addSubview(subtitle)
        cell.addSubview(input)
        cell.addSubview(button)
        cell.addSubview(terms)
        
        cell.addConstraints([
            terms.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -24),
            terms.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 24),
            terms.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -24),
            terms.heightAnchor.constraint(equalToConstant: 36),
        ])
        cell.addConstraints([
            button.bottomAnchor.constraint(equalTo: terms.topAnchor, constant: -24),
            button.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -24),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
        cell.addConstraints([
            input.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 24),
            input.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -24),
            input.bottomAnchor.constraint(lessThanOrEqualTo: button.topAnchor, constant: -24),
        ])
        cell.addConstraints([
            subtitle.bottomAnchor.constraint(equalTo: input.topAnchor, constant: -24),
            subtitle.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 24),
            subtitle.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -24),
            subtitle.heightAnchor.constraint(equalToConstant: 14),
        ])
        cell.addConstraints([
            image.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: -24),
            image.topAnchor.constraint(equalTo: cell.topAnchor),
            image.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            image.heightAnchor.constraint(lessThanOrEqualTo: image.widthAnchor)
        ])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return frame.height - safeAreaInsets.bottom
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        endEditing(true)
    }
}


extension AuthorizationPageNumber {
    @objc private func handleKeyboardNotification(notification: NSNotification) {
        if
            let userInfo = notification.userInfo,
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
            let height = isKeyboardShowing ? keyboardFrame.height : 0
            
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
            
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                self.layoutIfNeeded()
            }, completion: { _ in })
        }
    }
}
