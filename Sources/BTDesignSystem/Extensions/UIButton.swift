//
//  UIButton.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 09/03/22.
//

import UIKit

public extension UIButton {
    func disable() {
        isEnabled = false
        backgroundColor = .color(.primary).withAlphaComponent(0.5)
    }
    
    func enable() {
        isEnabled = true
        
        UIView.animate(withDuration: 0.75) {
            self.backgroundColor = .color(.primary)
            self.layoutIfNeeded()
        }
    }
}
