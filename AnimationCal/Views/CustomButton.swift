//
//  CustomButton.swift
//  CALCULATE
//
//  Created by Ogabek Mansurov on 12/06/23.
//

import UIKit

class CustomButton: UIButton {
    
    enum ButtonType {
        case calculate
        case clear
        case saved
    }
    
    init(title: String, hasBackground: Bool = true, fontSize: ButtonType) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? UIColor(hexString: "#19A975") : .red
        
        let titleColor: UIColor = hasBackground ? .white : .white
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .calculate:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
            
        case .clear:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
            
        case .saved:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



