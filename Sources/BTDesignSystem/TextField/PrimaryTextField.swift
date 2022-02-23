//
//  InputTextfield.swift
//  
//
//  Created by Fellipe thufik Costa Gomes Hoashi on 22/12/21.
//

import UIKit

public class PrimaryTextField: UITextField {
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public init(placeholder: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        setLeftPaddingPoints(10)
        layer.borderWidth = 1
        layer.cornerRadius = 4
        backgroundColor = .textFieldBackgroundColor()
        layer.borderColor = UIColor.textFieldBorderColor().cgColor
    }
}
