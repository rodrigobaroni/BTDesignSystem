//
//  PrimaryButton.swift
//  
//
//  Created by Fellipe thufik Costa Gomes Hoashi on 23/12/21.
//

import UIKit

public class PrimaryButton: UIButton {
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public init(title: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 4
        backgroundColor = .primaryColor()
        setTitle(title, for: .normal)
        
        heightAnchor(equalTo: 50)
    }
}
