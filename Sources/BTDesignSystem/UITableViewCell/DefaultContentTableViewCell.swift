//
//  DefaultContentView.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 04/04/22.
//

import UIKit

public class DefaultContentTableViewCell: UITableViewCell {

    lazy var titleLabel: HighTextLabel = {
        let label = HighTextLabel(text: title, textColor: .white)
        
        return label
    }()
    
    private lazy var defaultContentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .color(.primaryDark)
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private let title: String
    
    private let viewContent: UIView?
    
    public init(title: String, viewContent: UIView? = nil) {
        self.viewContent = viewContent
        self.title = title
        
        super.init(style: .default, reuseIdentifier: nil)
        
        setupView()
    }
}

extension DefaultContentTableViewCell: BTViewCode {
    public func setupHierarchy() {
        addSubview(defaultContentView)
        
        defaultContentView.addSubview(titleLabel)
        
        if let viewContent = viewContent {
            defaultContentView.addSubview(viewContent)
        }
    }
    
    public func setupConstraints() {
        defaultContentView.topAnchor(equalTo: topAnchor, constant: 16)
        defaultContentView.leadingAnchor(equalTo: leadingAnchor, constant: 16)
        defaultContentView.trailingAnchor(equalTo: trailingAnchor, constant: -16)
        defaultContentView.bottomAnchor(equalTo: bottomAnchor, constant: -16)
        
        if let viewContent = viewContent {
            titleLabel.topAnchor(equalTo: defaultContentView.topAnchor, constant: 16)
            titleLabel.centerXAnchor(equalTo: defaultContentView.centerXAnchor)

            viewContent.topAnchor(equalTo: titleLabel.bottomAnchor, constant: 16)
            viewContent.leadingAnchor(equalTo: defaultContentView.leadingAnchor)
            viewContent.trailingAnchor(equalTo: defaultContentView.trailingAnchor)
            viewContent.bottomAnchor(equalTo: defaultContentView.bottomAnchor, constant: -16)
        } else {
            heightAnchor(equalTo: 90)
            
            titleLabel.centerYAnchor(equalTo: defaultContentView.centerYAnchor)
            titleLabel.centerXAnchor(equalTo: defaultContentView.centerXAnchor)
        }
    }
    
    public func setupConfigurations() {
        selectionStyle = .none
    }
}
