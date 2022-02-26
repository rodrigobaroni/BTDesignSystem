//
//  ProgressView.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 24/02/22.
//

import UIKit

public class ProgressView: UIStackView {
    
    private let numberOfSteps: Int
    
    private let currentStep: Int
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    public init(numberOfSteps: Int, currentStep: Int) {
        self.numberOfSteps = numberOfSteps
        self.currentStep = currentStep
        
        super.init(frame: .zero)
        
        setupView()
    }
}

extension ProgressView: BTViewCode {
    public func setupHierarchy() {
        for index in 0..<numberOfSteps {
            let lineView = UIView()
            
            lineView.translatesAutoresizingMaskIntoConstraints = false
            
            if index == currentStep {
                lineView.backgroundColor = .color(.primary)
            } else {
                lineView.backgroundColor = .color(.background)
            }

            addArrangedSubview(lineView)
            
            lineView.heightAnchor(equalTo: 5)
            lineView.widthAnchor(equalTo: 30)
        }
    }
    
    public func setupConstraints() {
        
    }
    
    public func setupConfigurations() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .equalSpacing
        spacing = 8
    }
}
