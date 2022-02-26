//
//  HeaderTableViewCell.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 24/02/22.
//

import UIKit

public class HeaderTableViewCell: UITableViewCell {
    
    private lazy var headerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .color(.primary)
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private lazy var rightHeaderImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .settingsIcon()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var bodyView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .color(.background)
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return view
    }()
    
    private lazy var titleLabel = MediumTextLabel(text: title)
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private let title: String
    
    private let hasRightImage: Bool
    
    private let viewContent: UIView
    
    public init(title: String, hasRightImage: Bool = false, viewContent: UIView) {
        self.title = title
        self.hasRightImage = hasRightImage
        self.viewContent = viewContent
        
        super.init(style: .default, reuseIdentifier: nil)
        
        setupView()
    }
}

extension HeaderTableViewCell:  BTViewCode {
    public func setupHierarchy() {
        addSubview(headerView)
        addSubview(bodyView)
        
        headerView.addSubview(titleLabel)
        bodyView.addSubview(viewContent)
        
        if hasRightImage {
            headerView.addSubview(rightHeaderImageView)
        }
    }
    
    public func setupConstraints() {
        headerView.topAnchor(equalTo: topAnchor)
        headerView.leadingAnchor(equalTo: leadingAnchor, constant: 16)
        headerView.trailingAnchor(equalTo: trailingAnchor, constant: -16)
        headerView.heightAnchor(equalTo: 48)
        
        titleLabel.centerXAnchor(equalTo: headerView.centerXAnchor)
        titleLabel.centerYAnchor(equalTo: headerView.centerYAnchor)
        
        if hasRightImage {
            rightHeaderImageView.heightAnchor(equalTo: 25)
            rightHeaderImageView.widthAnchor(equalTo: 25)
            rightHeaderImageView.trailingAnchor(equalTo: headerView.trailingAnchor, constant: -16)
            rightHeaderImageView.centerYAnchor(equalTo: headerView.centerYAnchor)
        }
        
        bodyView.topAnchor(equalTo: headerView.bottomAnchor, constant: -5)
        bodyView.leadingAnchor(equalTo: leadingAnchor, constant: 16)
        bodyView.trailingAnchor(equalTo: trailingAnchor, constant: -16)
        bodyView.bottomAnchor(equalTo: bottomAnchor, constant: -16)
        
        viewContent.topAnchor(equalTo: bodyView.topAnchor, constant: 16)
        viewContent.leadingAnchor(equalTo: bodyView.leadingAnchor, constant: 16)
        viewContent.trailingAnchor(equalTo: bodyView.trailingAnchor, constant: -16)
        viewContent.bottomAnchor(equalTo: bodyView.bottomAnchor, constant: -16)
    }
    
    public func setupConfigurations() {
        selectionStyle = .none
    }
}
