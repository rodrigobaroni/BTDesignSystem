//
//  ContentView.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 04/04/22.
//

import UIKit

class ContentView: UIView {
    
    private lazy var descriptionLabel: SmallTextLabel = {
        let label = SmallTextLabel(text: descriptionValue, textColor: .white)
        
        return label
    }()
    
    private lazy var valueLabel: SmallTextLabel = {
        let label = SmallTextLabel(text: value, textColor: .white)
        
        return label
    }()

    private let descriptionValue: String
    
    private let value: String
    
    required init?(coder: NSCoder) {
        nil
    }
    
    init(descriptionValue: String, value: String) {
        self.descriptionValue = descriptionValue
        self.value = value
        
        super.init(frame: .zero)
        
        setupView()
    }
}

extension ContentView: BTViewCode {
    func setupHierarchy() {
        addSubview(descriptionLabel)
        addSubview(valueLabel)
    }
    
    func setupConstraints() {
        descriptionLabel.topAnchor(equalTo: topAnchor)
        descriptionLabel.leadingAnchor(equalTo: leadingAnchor, constant: 16)
        descriptionLabel.bottomAnchor(equalTo: bottomAnchor)
        
        valueLabel.topAnchor(equalTo: topAnchor)
        valueLabel.leadingAnchor(equalTo: descriptionLabel.trailingAnchor, constant: 16)
        valueLabel.bottomAnchor(equalTo: bottomAnchor)
    }
    
    func setupConfigurations() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
