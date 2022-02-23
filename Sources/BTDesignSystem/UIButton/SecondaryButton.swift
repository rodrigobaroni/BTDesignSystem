//
//  SecondaryButton.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi on 22/02/22.
//

import UIKit

public class SecondaryButton: UIButton {

    required init?(coder: NSCoder) {
        nil
    }
    
    public init(title: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryColor().cgColor
        setTitleColor(.primaryColor(), for: .normal)
        setTitle(title, for: .normal)
        
        heightAnchor(equalTo: 50)
        widthAnchor(equalTo: 210)
    }
}
