//
//  EmptyView.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 14/03/22.
//

import Foundation
import UIKit

public class EmptyView: UIView {
    
    private lazy var descriptionLabel: MediumTextLabel = {
        let label = MediumTextLabel(text: "Não há dados")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    required init?(coder: NSCoder) {
        nil
    }
    
    public init() {
        super.init(frame: .zero)
        
        setupView()
    }
}

extension EmptyView: BTViewCode {
    public func setupHierarchy() {
        addSubview(descriptionLabel)
    }
    
    public func setupConstraints() {
        descriptionLabel.centerXAnchor(equalTo: centerXAnchor)
        descriptionLabel.centerYAnchor(equalTo: centerYAnchor)
    }
    
    public func setupConfigurations() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
