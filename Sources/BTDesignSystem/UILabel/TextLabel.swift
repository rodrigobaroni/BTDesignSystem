//
//  TextLabel.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 24/02/22.
//

import UIKit

public class TextLabel: UILabel {


    required init?(coder: NSCoder) {
        nil
    }
    
    public init(text: String, fontSize: FontSize) {
        super.init(frame: .zero)
        
        self.text = text
        self.font = .font(fontSize)
        self.textColor = .white
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
