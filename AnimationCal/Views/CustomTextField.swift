//
//  CustomTextField.swift
//  CALCULATE
//
//  Created by Ogabek Mansurov on 12/06/23.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case mortgageValue
        case interestRate
        case MonthlyPayment
        case noOfYearsTime
        case PrincipalAmount
        case deposit
        case futureValue
        case totalNoDeposit
        case NoOfCompound
        case NoOfDeposits
    }
    
    private let authFieldType: CustomTextFieldType
            
    init(fieldType: CustomTextFieldType, backgroundColor: UIColor) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
    
        
        self.backgroundColor = backgroundColor.withAlphaComponent(0.5)
        self.layer.cornerRadius = 10
        self.textColor = .white
        self.layer.borderColor = UIColor(hexString: "004d66").cgColor
        self.layer.borderWidth = 1
        self.keyboardType = .numberPad
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        let color = UIColor.white
        switch fieldType {
            
        case .mortgageValue:
            changePlaceholder(txt: "17500", color: color)
            self.keyboardType = .numberPad
        case .interestRate:
            changePlaceholder(txt: "4.125", color: color)
            self.keyboardType = .numberPad
        case .noOfYearsTime:
            changePlaceholder(txt: "30", color: color)
            self.keyboardType = .numberPad
        case .MonthlyPayment:
            changePlaceholder(txt: "875.15", color: color)
            self.keyboardType = .numberPad
        case .PrincipalAmount:
            changePlaceholder(txt: "500", color: color)
            self.keyboardType = .numberPad
        case .deposit:
            changePlaceholder(txt: "0.75", color: color)
            self.keyboardType = .numberPad
        case .totalNoDeposit:
            changePlaceholder(txt: "50", color: color)
            self.keyboardType = .default
        case .NoOfCompound:
            changePlaceholder(txt: "12", color: color)
            self.keyboardType = .default
        case .futureValue:
            changePlaceholder(txt: "6767.64", color: color)
            self.keyboardType = .numberPad
        case .NoOfDeposits:
            changePlaceholder(txt: "120", color: color)
            self.keyboardType = .numberPad
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changePlaceholder(txt:String, color:UIColor){
        self.attributedPlaceholder = NSAttributedString(
            string: txt,
            attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
}



