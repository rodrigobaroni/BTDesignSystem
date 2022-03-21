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
    
    public func showLoading() {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        
        activityIndicator.tintColor = .color(.primary)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        
        view.addSubview(activityIndicator)
        
        activityIndicator.centerYAnchor(equalTo: view.centerYAnchor)
        activityIndicator.centerXAnchor(equalTo: view.centerXAnchor)
    }
    
    public func hideLoading() {
        view.subviews.forEach { view in
            guard let v = view as? UIActivityIndicatorView else {
                return
            }
            
            v.removeFromSuperview()
        }
    }
    
}
