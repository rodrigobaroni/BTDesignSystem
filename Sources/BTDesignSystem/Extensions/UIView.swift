//
//  UIView.swift
//  
//
//  Created by Fellipe thufik Costa Gomes Hoashi on 22/12/21.
//

import UIKit

extension UIView {
    // MARK: - TopAnchor
    
    @discardableResult public func topAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        topAnchor.constraint(equalTo: anchor, constant: constant).priority = priority
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult public func topAnchor(greaterThan anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).priority = priority
        topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult public func topAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).priority = priority
        topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        
        return self
    }
    
    // MARK: - BottomAnchor
    
    @discardableResult public func bottomAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        bottomAnchor.constraint(equalTo: anchor, constant: constant).priority = priority
        bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult public func bottomAnchor(greaterThan anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).priority = priority
        bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult public func bottomAnchor(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).priority = priority
        bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant).isActive = true
        return self
    }
    
    // MARK: - LeadingAnchor
    
    @discardableResult public func leadingAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        leadingAnchor.constraint(equalTo: anchor, constant: constant).priority = priority
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    // MARK: - TrailingAnchor
    
    @discardableResult public func trailingAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        trailingAnchor.constraint(equalTo: anchor, constant: constant).priority = priority
        trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    // MARK: - HeightAnchor
    
    @discardableResult public func heightAnchor(equalTo height: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        heightAnchor.constraint(equalToConstant: height).priority = priority
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult public func heightAnchor(greaterThanOrEqualToConstant height: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        heightAnchor.constraint(greaterThanOrEqualToConstant: height).priority = priority
        heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
        return self
    }
    
    @discardableResult public func heightAnchor(greaterThanOrEqualTo nsLayoutDimension: NSLayoutDimension, priority: UILayoutPriority = UILayoutPriority.required, multiplier: CGFloat = 1) -> Self {
        heightAnchor.constraint(greaterThanOrEqualTo: nsLayoutDimension, multiplier: multiplier).priority = priority
        heightAnchor.constraint(greaterThanOrEqualTo: nsLayoutDimension, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult public func heightAnchor(equalTo nsLayoutDimension: NSLayoutDimension, priority: UILayoutPriority = UILayoutPriority.required, multiplier: CGFloat = 1) -> Self {
        heightAnchor.constraint(equalTo: nsLayoutDimension, multiplier: multiplier).priority = priority
        heightAnchor.constraint(equalTo: nsLayoutDimension, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult public func heightAnchor(lessThanOrEqualToConstant height: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        heightAnchor.constraint(lessThanOrEqualToConstant: height).priority = priority
        heightAnchor.constraint(lessThanOrEqualToConstant: height).isActive = true
        return self
    }
    
    // MARK: - WidthAnchor
    
    @discardableResult public func widthAnchor(equalTo width: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        widthAnchor.constraint(equalToConstant: width).priority = priority
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult public func widthAnchor(equalTo nsLayoutDimension: NSLayoutDimension, priority: UILayoutPriority = UILayoutPriority.required, multiplier: CGFloat = 1) -> Self {
        widthAnchor.constraint(equalTo: nsLayoutDimension, multiplier: multiplier).priority = priority
        widthAnchor.constraint(equalTo: nsLayoutDimension, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult public func widthAnchor(greaterThanOrEqualToConstant width: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        widthAnchor.constraint(greaterThanOrEqualToConstant: width).priority = priority
        widthAnchor.constraint(greaterThanOrEqualToConstant: width).isActive = true
        return self
    }
    
    @discardableResult public func widthAnchor(lessThanOrEqualToConstant width: CGFloat, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        widthAnchor.constraint(lessThanOrEqualToConstant: width).priority = priority
        widthAnchor.constraint(lessThanOrEqualToConstant: width).isActive = true
        return self
    }
    
    // MARK: - CenterAnchor
    
    @discardableResult public func centerXAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        centerXAnchor.constraint(equalTo: anchor, constant: constant).priority = priority
        centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult public func centerYAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        centerYAnchor.constraint(equalTo: anchor, constant: constant).priority = priority
        centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
}

