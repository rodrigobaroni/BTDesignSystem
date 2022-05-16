//
//  UIStackView.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 24/02/22.
//

import UIKit

public enum GenericHealthFields {
    case hour
    case date
    case quantity
    case doctor
    case speciallity
    case medicine
    case dosage
    
    
    public var value: String {
        switch self {
        case .hour:
            return "Horário"
        case .date:
            return "Data"
        case .quantity:
            return "Quantidade"
        case .doctor:
            return "Médico"
        case .speciallity:
            return "Especialidade"
        case .medicine:
            return "Medicamento"
        case .dosage:
            return "Dosagem"
        }
    }
}

public class MedicinesStackView: UIStackView {
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private var items: [String: GenericHealthFields] = [:]
    
    public init(items: [String: GenericHealthFields]) {
        super.init(frame: .zero)
        
        self.items = items
        
        setupView()
    }
}

extension MedicinesStackView: BTViewCode {
    public func setupHierarchy() {
        
        items.forEach { element in
            let fieldType = element.value
            
            let hourStackView = UIStackView()
            
            hourStackView.axis = .horizontal
            hourStackView.spacing = 8
            hourStackView.distribution = .equalSpacing
            
            let fieldDescription = MediumTextLabel(text: fieldType.value)
            
            let fieldValue = MediumTextLabel(text: element.key)
            
            hourStackView.addArrangedSubview(fieldDescription)
            hourStackView.addArrangedSubview(fieldValue)
            
            addArrangedSubview(hourStackView)
        }
    }
    
    public func setupConstraints() {
        
    }
    
    public func setupConfigurations() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 10
    }
}

