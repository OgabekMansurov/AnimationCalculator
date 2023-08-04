//
//  UITextField+Validations.swift
//  CALCULATE
//
//  Created by Ogabek Mansurov on 12/06/23.
//


import Foundation
import UIKit

extension UITextField {
        func checkIfEmpty() -> Bool{
        if self.text!.count > 0 {
            return false
        } else {
            return true
        }
    }
    
}


