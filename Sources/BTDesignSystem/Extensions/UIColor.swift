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
           return #colorLiteral(red: 0, green: 0.7305232882, blue: 0.6851475239, alpha: 1)
        case .primaryDark:
            return #colorLiteral(red: 0.0196078431372549, green: 0.5568627450980392, blue: 0.5254901960784314, alpha: 1)
        case .secondary:
           return #colorLiteral(red: 0, green: 0.7305232882, blue: 0.6851475239, alpha: 1)
        case .tertiary:
           return #colorLiteral(red: 0, green: 0.7305232882, blue: 0.6851475239, alpha: 1)
        case .background:
           return #colorLiteral(red: 0.7607084513, green: 0.7608374953, blue: 0.7606915236, alpha: 1)
        case .blur:
           return #colorLiteral(red: 0.3999576569, green: 0.4000295997, blue: 0.3999481499, alpha: 1)
        case .chatBackgroundColor:
            return #colorLiteral(red: 0.094117647058824, green: 0.098039215686275, blue: 0.113725490196078, alpha: 1)
        case .customerChatColor:
            return #colorLiteral(red: 0.286274509803922, green: 0.298039215686275, blue: 0.415686274509804, alpha: 1)
        }
    }
}

public enum ColorType {
    case primary
    case primaryDark
    case secondary
    case tertiary
    case background
    case blur
    case chatBackgroundColor
    case customerChatColor
}
