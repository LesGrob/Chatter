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
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        configurePicker()
    }

    private func setupView(){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        backgroundColor = UIColor.Default.backgroundLightGray
        layer.cornerRadius = 14
        
        
        zoneInput = UITextField()
        zoneInput.translatesAutoresizingMaskIntoConstraints = false
        zoneInput.font = .customFont(ofSize: 16, weight: .light)
        zoneInput.text = "+20"
        zoneInput.textColor = UIColor.Default.black
        
        let arrow = UIImageView(image: UIImage(named: "arrow_down"))
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.heightAnchor.constraint(equalToConstant: 9).isActive = true
        arrow.widthAnchor.constraint(equalToConstant: 9).isActive = true
        zoneInput.rightView = arrow
        zoneInput.rightViewMode = .always
        
        addSubview(zoneInput)
        addConstraints([
            zoneInput.widthAnchor.constraint(equalToConstant: 42),
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
        numberInput.text = "9231239898"
        numberInput.textColor = UIColor.Default.black
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
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        addSubview(picker)

        addConstraints([
            picker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            picker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            picker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
        
        self.zoneInput.inputView = picker
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
}
