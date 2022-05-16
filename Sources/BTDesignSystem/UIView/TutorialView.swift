//
//  Tutorial View.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 21/03/22.
//

import Foundation
import UIKit

public class TutorialView: UIView {
    
    private lazy var tutorialImageView: UIImageView = {
        let imageView = UIImageView(image: image)
       
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var tutorialDescriptionLabel: MediumTextLabel = {
        let label = MediumTextLabel(text: descriptionText, textColor: .color(.background), isBold: true)
        
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    public lazy var continueButton: SecondaryButton = {
        let button = SecondaryButton(title: "CONTINUAR")
        
        return button
    }()
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private let descriptionText: String
    
    private let image: UIImage
    
    public init(descriptionText: String, image: UIImage) {
        self.descriptionText = descriptionText
        self.image = image
        
        super.init(frame: .zero)
        
        setupView()
    }
}

extension TutorialView: BTViewCode {
    public func setupHierarchy() {
        addSubview(tutorialImageView)
        addSubview(tutorialDescriptionLabel)
        addSubview(continueButton)
    }
    
    public func setupConstraints() {
        tutorialImageView.topAnchor(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32)
        tutorialImageView.leadingAnchor(equalTo: leadingAnchor, constant: 16)
        tutorialImageView.trailingAnchor(equalTo: trailingAnchor, constant: -16)
        tutorialImageView.heightAnchor(equalTo: heightAnchor, multiplier: 0.3)
        
        tutorialDescriptionLabel.topAnchor(equalTo: tutorialImageView.bottomAnchor, constant: 16)
        tutorialDescriptionLabel.leadingAnchor(equalTo: leadingAnchor, constant: 32)
        tutorialDescriptionLabel.trailingAnchor(equalTo: trailingAnchor, constant: -32)
        
        continueButton.topAnchor(equalTo: tutorialDescriptionLabel.bottomAnchor, constant: 16)
        continueButton.leadingAnchor(equalTo: leadingAnchor, constant: 16)
        continueButton.trailingAnchor(equalTo: trailingAnchor, constant: -16)
        continueButton.bottomAnchor(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        continueButton.centerXAnchor(equalTo: centerXAnchor)
        
    }
    
    public func setupConfigurations() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
