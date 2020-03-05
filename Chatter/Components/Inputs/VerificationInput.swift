//
//  VerificationInput.swift
//  Chatter
//
//  Created by Nick Kurochkin on 10.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

@IBDesignable
class VerificationInput: UIControl, UIKeyInput {
    public static var height: CGFloat { return NumberView.height }
    //    MARK:- custom properties
    public var text: String { get { return String(characters) } }
    private var characters: [Character] = []
    private var labelFont: UIFont = UIFont.customFont(ofSize: 16, weight: .medium)
    
    //    MARK:- custom style properties
    private let spacing: CGFloat = 12
    @IBInspectable var numberOfDigits: Int  = 6 {
        didSet {
            self.setupViews()
            self.setNeedsDisplay()
        }
    }
    
    private lazy var numbersStack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fill
        view.spacing = spacing
        let tap = UITapGestureRecognizer(target: self, action: #selector(onStackTap))
        view.addGestureRecognizer(tap)

        return view
    }()
    
    @objc func onStackTap(_ sender: UIGestureRecognizer){
        becomeFirstResponder()
    }
    
    //    MARK:- overrides
    var keyboardType: UIKeyboardType { get { .numberPad } set { } }
    var hasText: Bool { return characters.count != 0 }
    override var canBecomeFirstResponder: Bool { return true }
   
    //    MARK:- init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
        setupViews()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addViews()
        setupViews()
    }
}

//    MARK:- style initialization
extension VerificationInput {
    private func addViews() {
        self.backgroundColor = .clear
        addSubview(numbersStack)
    }
    
    private func setupViews() {
        for numberView in numbersStack.arrangedSubviews {
            numberView.removeFromSuperview()
        }
        layoutIfNeeded()
        
        addConstraints([
            numbersStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            numbersStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            numbersStack.heightAnchor.constraint(equalToConstant: NumberView.height),
            numbersStack.widthAnchor.constraint(equalToConstant: CGFloat(numberOfDigits) * (spacing + NumberView.height * 0.8) - spacing),
        ])
        
        for i in 1...numberOfDigits {
            let number = NumberView()
            number.tag = i
            number.translatesAutoresizingMaskIntoConstraints = false
            numbersStack.addArrangedSubview(number)
            numbersStack.addConstraints([
                number.heightAnchor.constraint(equalTo: numbersStack.heightAnchor),
                number.widthAnchor.constraint(equalTo: number.heightAnchor, multiplier: 0.8),
            ])
        }
    }
}

//    MARK:- input methods
extension VerificationInput {
    func insertText(_ text: String) {
        let newCount = (text.count + characters.count)
        guard newCount <= numberOfDigits else {
            self.sendActions(for: .editingDidEnd)
            return
        }
        (viewWithTag(newCount) as! NumberView).key = text
        setCharacters()
    }
    
    func deleteBackward() {
        guard characters.count > 0 else { return }
        (viewWithTag(characters.count) as! NumberView).key = ""
        setCharacters()
    }
    
    func clear() {
        while hasText {
            deleteBackward()
        }
    }
    
    private func setCharacters() {
        characters = []
        for i in 1...numberOfDigits {
            let key = (viewWithTag(i) as! NumberView).key
            if let char = key.first {
                characters.append(char)
            }
        }
    }
}

//    MARK:- munber view for stackView
fileprivate class NumberView: UIView {
    private static var labelFont: UIFont = UIFont.customFont(ofSize: 18, weight: .light)
    private static var padding: CGFloat = 3.0
    private static var borderSize: CGFloat = 1.0
    static var height: CGFloat {
        get { return NumberView.padding + NumberView.labelFont.lineHeight + NumberView.borderSize }
        set { }
    }
    
    var key: String = "" {
        didSet { setupViews() }
    }
    
    var hasText: Bool {
        return key != ""
    }
    
    private var label: UILabel = {
        let view = UILabel()
        view.font = .customFont(ofSize: 18, weight: .light)
        view.textColor = UIColor.Default.black
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var border: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.Default.black
        return view
    }()
    
    override var bounds: CGRect {
        didSet { setupViews() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        addSubview(label)
        addSubview(border)
        addConstraints([
            border.bottomAnchor.constraint(equalTo: bottomAnchor),
            border.leadingAnchor.constraint(equalTo: leadingAnchor),
            border.trailingAnchor.constraint(equalTo: trailingAnchor),
            border.heightAnchor.constraint(equalToConstant: NumberView.borderSize),
        ])
        addConstraints([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: border.topAnchor, constant: -NumberView.padding),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func setupViews() {
        label.text = key.isEmpty ? "*" : key
    }
}
