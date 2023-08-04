//
//  Double+Round.swift
//  CALCULATE
//
//  Created by Ogabek Mansurov on 12/06/23.
//

import Foundation
import UIKit

extension Double {

    func roundTo2() -> Double {
        let divisor = pow(10.0, 2.0)
        let rounded = (self * divisor).rounded() / divisor
        return rounded
    }
    
    
}

