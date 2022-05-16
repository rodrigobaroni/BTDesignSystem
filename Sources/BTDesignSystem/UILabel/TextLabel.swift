//
//  TextLabel.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 24/02/22.
//

import UIKit
import SwiftUI

public class TextLabel: UILabel {


    required init?(coder: NSCoder) {
        nil
    }
    
    public init(text: String, fontSize: FontSize, textColor: UIColor, isBold: Bool, alignment: NSTextAlignment) {
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = textColor
        
        if isBold {
            self.font = .boldFont(fontSize)
        } else {
            self.font = .font(fontSize)
        }
        
        textAlignment = alignment
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}

public class SmallTextLabel: TextLabel {
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public init(text: String, textColor: UIColor = .black, isBold: Bool = false, aligment: NSTextAlignment = .natural) {
        super.init(text: text, fontSize: .small, textColor: textColor, isBold: isBold, alignment: aligment)
    }
}

public class MediumTextLabel: TextLabel {
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public init(text: String, textColor: UIColor = .black, isBold: Bool = false, aligment: NSTextAlignment = .natural) {
        super.init(text: text, fontSize: .medium, textColor: textColor, isBold: isBold, alignment: aligment)
    }
}

public class HighTextLabel: TextLabel {
    
    required init?(coder: NSCoder) {
        nil
    }
    
    public init(text: String, textColor: UIColor = .black, isBold: Bool = false, aligment: NSTextAlignment = .natural) {
        super.init(text: text, fontSize: .high, textColor: textColor, isBold: isBold, alignment: aligment)
    }
}
