//
//  UIColor.swift
//  
//
//  Created by Fellipe thufik Costa Gomes Hoashi on 23/12/21.
//

import UIKit

extension UIColor {
    
    public static func color(_ color: ColorType) -> UIColor {
        switch color {
        case .primary:
           return #colorLiteral(red: 0, green: 0.5674290061, blue: 0.5275757313, alpha: 1)
        case .secondary:
           return #colorLiteral(red: 0, green: 0.7305232882, blue: 0.6851475239, alpha: 1)
        case .tertiary:
           return #colorLiteral(red: 0, green: 0.7305232882, blue: 0.6851475239, alpha: 1)
        case .background:
           return #colorLiteral(red: 0.7607084513, green: 0.7608374953, blue: 0.7606915236, alpha: 1)
        case .blur:
           return #colorLiteral(red: 0.3999576569, green: 0.4000295997, blue: 0.3999481499, alpha: 1)
        }
    }
}

public enum ColorType {
    case primary
    case secondary
    case tertiary
    case background
    case blur
}

