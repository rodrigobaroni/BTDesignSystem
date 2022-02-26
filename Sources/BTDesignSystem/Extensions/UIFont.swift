//
//  File.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 24/02/22.
//

import UIKit

extension UIFont {
    public static func font(_ type: FontSize) -> UIFont {
        var font: UIFont?
        
        switch type {
        case .small:
            font = .systemFont(ofSize: 14)
        case .medium:
            font = .systemFont(ofSize: 16)
        case .high:
            font = .systemFont(ofSize: 24)
        }
        
        return font ?? .systemFont(ofSize: 16)
    }
    
    public static func boldFont(_ type: FontSize) -> UIFont {
        var font: UIFont?
        
        switch type {
        case .small:
            font = .boldSystemFont(ofSize: 14)
        case .medium:
            font = .boldSystemFont(ofSize: 16)
        case .high:
            font = .boldSystemFont(ofSize: 24)
        }
        
        return font ?? .boldSystemFont(ofSize: 16)
    }
}

public enum FontSize {
    case small
    case medium
    case high
}
