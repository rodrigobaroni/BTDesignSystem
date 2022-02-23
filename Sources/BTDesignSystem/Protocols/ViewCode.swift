//
//  ViewCode.swift
//  
//
//  Created by Fellipe thufik Costa Gomes Hoashi on 22/12/21.
//

import UIKit

public protocol BTViewCode {
    
    /// Criação da hierarquia de views
    func setupHierarchy()
    
    /// Criação e ativação de constraints
    func setupConstraints()
    
    /// Configurações do componente
    func setupConfigurations()
}

public extension BTViewCode {
    
    func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
    }
}
