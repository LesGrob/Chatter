//
//  PhoneInput.swift
//  Chatter
//
//  Created by Nick Kurochkin on 04.02.2020.
//  Copyright © 2020 Nick Kurochkin. All rights reserved.
//

import UIKit

class PhoneInput: UIView, UIPickerViewDataSource, UIPickerViewDelegate {
    private var zoneInput: UITextField!
    private var numberInput: UITextField!
    
    private var separatorView: UIView!
    
    private let zones: [String] = ["+7", "+20", "+44"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configurePicker()
        dismissPickerView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        configurePicker()
        dismissPickerView()
    }

    private func setupView(){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        backgroundColor = UIColor.Default.backgroundLightGray
        layer.cornerRadius = 14
        
        
        zoneInput = UITextField()
        zoneInput.translatesAutoresizingMaskIntoConstraints = false
        zoneInput.font = .customFont(ofSize: 16, weight: .light)
        zoneInput.text = self.zones[0]
        zoneInput.textColor = UIColor.Default.textBlack
        
        let arrowImg = UIImage.resize(image: UIImage(named: "arrow_down"), targetSize: CGSize(width: 9, height: 9))
        let arrow = UIImageView(image: arrowImg)
        arrow.frame = CGRect(x: 0, y: 0, width: 9, height: 9)
        zoneInput.rightView = arrow
        zoneInput.rightViewMode = .always
        
        addSubview(zoneInput)
        addConstraints([
            zoneInput.widthAnchor.constraint(equalToConstant: 47),
            zoneInput.topAnchor.constraint(equalTo: topAnchor),
            zoneInput.bottomAnchor.constraint(equalTo: bottomAnchor),
            zoneInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18)
        ])
        
        
        separatorView = UIView()
        separatorView.backgroundColor = UIColor.Default.darkGray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separatorView)
        addConstraints([
            separatorView.widthAnchor.constraint(equalToConstant: 1),
            separatorView.heightAnchor.constraint(equalToConstant: 20),
            separatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            separatorView.leadingAnchor.constraint(equalTo: zoneInput.trailingAnchor, constant: 10)
        ])
        
        numberInput = UITextField()
        numberInput.translatesAutoresizingMaskIntoConstraints = false
        numberInput.font = .customFont(ofSize: 16, weight: .light)
        numberInput.keyboardType = .numberPad
        numberInput.text = ""
        numberInput.textColor = UIColor.Default.textBlack
        numberInput.delegate = self
        addSubview(numberInput)
        addConstraints([
            numberInput.topAnchor.constraint(equalTo: topAnchor),
            numberInput.bottomAnchor.constraint(equalTo: bottomAnchor),
            numberInput.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 10),
            numberInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18)
        ])
    }
    
    private func configurePicker(){
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        self.zoneInput.inputView = picker
    }
    
    private func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissPicker))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
       self.zoneInput.inputAccessoryView = toolBar
    }
}


extension PhoneInput {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.zones.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.zones[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.zoneInput.text = self.zones[row]
    }
    
    @objc func dismissPicker() {
        self.endEditing(true)
    }
}

extension PhoneInput: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 10
    }
}
