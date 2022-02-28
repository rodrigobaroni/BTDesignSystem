//
//  File.swift
//  
//
//  Created by Rodrigo Baroni on 28/02/22.
//

import Foundation
import UIKit
import SwiftUI

extension UIViewController {
    
    private struct Preview: UIViewControllerRepresentable {
        
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
        
    }
    
    public var preview: some View {
        return Preview(viewController: self)
    }
    
}
