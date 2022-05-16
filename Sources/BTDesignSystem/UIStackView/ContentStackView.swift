//
//  ContentStackView.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 04/04/22.
//

import UIKit

public class ContentStackView: UIStackView {

    private let descriptions: [String]
    
    private let values: [String]
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    public init(descriptions: [String], values: [String]) {
        self.descriptions = descriptions
        self.values = values
        
        super.init(frame: .zero)
        
        setupView()
    }
}

extension ContentStackView: BTViewCode {
    public func setupHierarchy() {
        
        zip(descriptions, values).forEach { (descriptionValue, value) in
            let contentView = ContentView(descriptionValue: descriptionValue, value: value)
            
            addArrangedSubview(contentView)
        }
    }
    
    public func setupConstraints() {
        
    }
    
    public func setupConfigurations() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 16
    }
}
