//
//  AuthHeaderView.swift
//  CALCULATE
//
//  Created by Ogabek Mansurov on 12/06/23.
//

import UIKit

class Dismiss: UIView {
    
    private let dismissView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "dismiss")
        return iv
    }()
    
    init(dismistru: Bool = true) {
        super.init(frame: .zero)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        
        self.addSubview(dismissView)
        
        dismissView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.dismissView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 2),
            self.dismissView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 2),
            self.dismissView.heightAnchor.constraint(equalToConstant: self.frame.size.width/10),
            self.dismissView.widthAnchor.constraint(equalToConstant: self.frame.size.width/10),
        ])
        
    }
}



