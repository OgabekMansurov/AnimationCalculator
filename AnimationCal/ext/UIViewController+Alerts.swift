//
//   UIViewController+Alerts.swift
//  CALCULATE
//
//  Created by Ogabek Mansurov on 12/06/23.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

