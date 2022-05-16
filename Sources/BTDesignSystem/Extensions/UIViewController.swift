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
        DispatchQueue.main.async {
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            
            activityIndicator.tintColor = .color(.primary)
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            activityIndicator.startAnimating()
            
            self.view.addSubview(activityIndicator)
            
            activityIndicator.centerYAnchor(equalTo: self.view.centerYAnchor)
            activityIndicator.centerXAnchor(equalTo: self.view.centerXAnchor)
        }
    }
    
    public func hideLoading() {
        DispatchQueue.main.async {
            self.view.subviews.forEach { view in
                guard let v = view as? UIActivityIndicatorView else {
                    return
                }
                
                v.removeFromSuperview()
            }
        }
    }
    
    public func showAdvice(type: AdviceType, descriptionText: String? = nil, completionHandler: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            guard let descriptionText = descriptionText else {
                let adviceViewController = GenericAdviceViewController(type: type, completionHandler: completionHandler)
                
                self.present(adviceViewController, animated: true)
                return
            }

            let adviceViewController = GenericAdviceViewController(type: type, descriptionText: descriptionText, completionHandler: completionHandler)
            
            self.present(adviceViewController, animated: true)
        }
    }
}
