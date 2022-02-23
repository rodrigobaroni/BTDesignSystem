//
//  UnderlinedButton.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 22/02/22.
//

import UIKit

public class UnderlinedButton: UIButton {

    required init?(coder: NSCoder) {
        nil
    }
    
    public init(title: String) {
        super.init(frame: .zero)
        
        let attributedString = NSMutableAttributedString.init(string: title)
        
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
                    NSRange.init(location: 0, length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.primaryColor(), range:
                    NSRange.init(location: 0, length: attributedString.length))
        
        translatesAutoresizingMaskIntoConstraints = false
        setAttributedTitle(attributedString, for: .normal)
    }
}
