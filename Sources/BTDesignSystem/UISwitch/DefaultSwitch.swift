//
//  DefaultSwitch.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 26/02/22.
//

import UIKit

public class DefaultSwitch: UISwitch {

    required init?(coder: NSCoder) {
        nil
    }
    
    public init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false

        tintColor = .color(.primary)
        thumbTintColor = .color(.background)
    }
}
