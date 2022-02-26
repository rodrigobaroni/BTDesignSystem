//
//  File.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 24/02/22.
//

import UIKit

extension UIFont {
    public static func font(_ type: FontSize) -> UIFont {
        
        let fontName = "Roboto-Regular"
        
        var font: UIFont?
        
        switch type {
        case .small:
            font =  UIFont(name: fontName, size: 18)
        case .medium:
            font = UIFont(name: fontName, size: 20)
        case .high:
            font =  UIFont(name: fontName, size: 24)
        }
        
        return font ?? .systemFont(ofSize: 18)
    }
}

public enum FontSize {
    case small
    case medium
    case high
}
