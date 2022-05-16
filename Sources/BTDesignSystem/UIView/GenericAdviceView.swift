//
//  ErrorView.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 01/04/22.
//

import UIKit

public enum AdviceType {
    case success
    case error
}

class GenericAdviceView: UIView {

    private lazy var headerImageView: HeaderImageView = {
        let imageview = HeaderImageView()
        
        imageview.image = UIImage(named: "headerImage")
        
        return imageview
    }()
    
    private lazy var errorImageView: ErrorImageView = {
        let imageview = ErrorImageView()
        
        switch type {
        case .success:
            imageview.image = UIImage(named: "SuccessImage")
        case .error:
            imageview.image = UIImage(named: "ErrorImage")
        }
        
        return imageview
    }()
    
    private lazy var descriptionLabel: UILabel = {
        switch type {
        case .success:
            return MediumTextLabel(text: descriptionText, aligment: .center)
        case .error:
            return MediumTextLabel(text: "Ops, algo deu errado! Tente novamente mais tarde.", aligment: .center)
        }
    }()
    
    lazy var backButton: SecondaryButton = {
        switch type {
        case .success:
            return SecondaryButton(title: "Prosseguir")
        case .error:
            return SecondaryButton(title: "Voltar")
        }
    }()
    
    private let type: AdviceType
    
    private let descriptionText: String
    
    required init?(coder: NSCoder) {
        nil
    }
    
    init(descriptionText: String, type: AdviceType) {
        self.descriptionText = descriptionText
        self.type = type
        
        super.init(frame: .zero)
        
        setupView()
    }
}

extension GenericAdviceView: BTViewCode {
    func setupHierarchy() {
        addSubview(headerImageView)
        addSubview(errorImageView)
        addSubview(descriptionLabel)
        addSubview(backButton)
    }
    
    func setupConstraints() {
        headerImageView.topAnchor(equalTo: topAnchor, constant: 0)
        headerImageView.leadingAnchor(equalTo: leadingAnchor, constant: 0)
        headerImageView.trailingAnchor(equalTo: trailingAnchor, constant: 0)
        headerImageView.heightAnchor(equalTo: 150)
        
        errorImageView.heightAnchor(equalTo: heightAnchor, multiplier: 0.4)
        errorImageView.topAnchor(equalTo: headerImageView.bottomAnchor, constant: 32)
        errorImageView.leadingAnchor(equalTo: leadingAnchor, constant: 16)
        errorImageView.trailingAnchor(equalTo: trailingAnchor, constant: -16)
        
        descriptionLabel.topAnchor(equalTo: errorImageView.bottomAnchor, constant: 16)
        descriptionLabel.leadingAnchor(equalTo: leadingAnchor, constant: 16)
        descriptionLabel.trailingAnchor(equalTo: trailingAnchor, constant: -16)
        
        backButton.leadingAnchor(equalTo: leadingAnchor, constant: 16)
        backButton.trailingAnchor(equalTo: trailingAnchor, constant: -16)
        backButton.bottomAnchor(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
    }
    
    func setupConfigurations() {
        backgroundColor = .white
    }
}
