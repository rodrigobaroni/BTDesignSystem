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

import Foundation
import SwiftUI

/**
 This part of code is use to show previews using UIKit
    - Author: Rodrigo Baroni
 - Warning: Only use this if you want to show te preview of your view
 
 struct PreviewView_Previews: PreviewProvider {
 static var previews: some View {
 PreviewView()
 }
 }*/
public struct UIViewPreview<View: UIView>: UIViewRepresentable {
    
    public let view: View
    
    public init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    public func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
}

