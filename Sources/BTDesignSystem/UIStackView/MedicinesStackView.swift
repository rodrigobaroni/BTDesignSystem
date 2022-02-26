//
//  UIStackView.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 24/02/22.
//

import UIKit

public class MedicinesStackView: UIStackView {
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private var items: [String] = []
    
    public init(items: [String]) {
        super.init(frame: .zero)
        
        self.items = items
        
        setupView()
    }
}

extension MedicinesStackView: BTViewCode {
    public func setupHierarchy() {
        for (index, item) in items.enumerated() {
            let label = TextLabel(text: item, fontSize: .medium)
            
            addArrangedSubview(label)
            
            if index != items.count - 1 {
                let lineView = UIView()
                
                lineView.translatesAutoresizingMaskIntoConstraints = false
                lineView.backgroundColor = .black
                
                addArrangedSubview(lineView)
                
                lineView.leadingAnchor(equalTo: leadingAnchor, constant: 16)
                lineView.trailingAnchor(equalTo: trailingAnchor, constant: -16)
                lineView.heightAnchor(equalTo: 1)
            }
        }
    }
    
    public func setupConstraints() {
        
    }
    
    public func setupConfigurations() {
        axis = .vertical
        spacing = 10
    }
}

