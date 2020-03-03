//
//  CustomTextField.swift
//  Chatter
//
//  Created by Nick Kurochkin on 11.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {
    private let padding = UIEdgeInsets(top: 12, left: 18, bottom: 12, right: 18)
    private let cornerRadius: CGFloat = 14.0
    var characterCountMax: Int = 99
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.Default.backgroundLightGray
        self.layer.cornerRadius = cornerRadius
        self.font = .customFont(ofSize: 17, weight: .light)
        self.textColor = UIColor.Default.textBlack
        self.delegate = self
    }
    
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
    //    MARK:- TextField delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= characterCountMax
    }
}

class CustomTextView: UITextView, UITextViewDelegate {
    private let padding = UIEdgeInsets(top: 12, left: 18, bottom: 12, right: 18)
    private let cornerRadius: CGFloat = 14.0
    private let customFont: UIFont = .customFont(ofSize: 17, weight: .light)
    private let customTextColor: UIColor = UIColor.Default.textBlack
    private let placeholderColor: UIColor = UIColor.lightGray
    
    private lazy var placeholderView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = self.placeholderColor
        view.font = customFont
        return view
    }()
    
    override var text: String! {
        didSet { self.placeholderView.isHidden = !self.text.isEmpty }
    }
    var characterCountMax: Int = 99
    var placeholder: String = "" {
        didSet { self.placeholderView.text = self.placeholder }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(placeholderView)
        
        self.backgroundColor = UIColor.Default.backgroundLightGray
        self.textContainerInset = padding
        self.layer.cornerRadius = cornerRadius
        self.font = customFont
        self.textColor = customTextColor
        self.isScrollEnabled = false
        self.delegate = self
        
        addConstraints([
            placeholderView.topAnchor.constraint(equalTo: topAnchor, constant: padding.top),
            placeholderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left + 5),
            placeholderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding.right),
            placeholderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding.bottom),
        ])
    }
    
    //    MARK:- TextField delegate
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let viewText = textView.text else { return true }
        let newLength = viewText.count + text.count - range.length
        return newLength <= characterCountMax
    }

    
    func textViewDidChange(_ textView: UITextView) {
        placeholderView.isHidden = !textView.text.isEmpty
    }
}
