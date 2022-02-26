//
//  DefaultTableViewCell.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 24/02/22.
//

import UIKit

public class ContentTableViewCell: UITableViewCell {

    private lazy var titleLabel = MediumTextLabel(text: title)
    
    private lazy var contentImageView: UIImageView = {
        let imageView = UIImageView(image: contentImage)
        
        imageView.layer.cornerRadius = 40
        imageView.backgroundColor = .color(.primary)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var defaultView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .color(.background)
        view.layer.cornerRadius = 40
        
        return view
    }()
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private let title: String
    
    private let hasRightImage: Bool
    
    private let contentImage: UIImage
    
    public init(title: String, contentImage: UIImage, hasRightImage: Bool = false) {
        self.title = title
        self.contentImage = contentImage
        self.hasRightImage = hasRightImage
        
        super.init(style: .default, reuseIdentifier: nil)
        
        setupView()
    }
}

extension ContentTableViewCell: BTViewCode {
    public func setupHierarchy() {
        addSubview(defaultView)
        
        defaultView.addSubview(contentImageView)
        defaultView.addSubview(titleLabel)
    }
    
    public func setupConstraints() {
        contentImageView.topAnchor(equalTo: defaultView.topAnchor)
        contentImageView.bottomAnchor(equalTo: defaultView.bottomAnchor)
        contentImageView.leadingAnchor(equalTo: defaultView.leadingAnchor)
        contentImageView.heightAnchor(equalTo: 80)
        contentImageView.widthAnchor(equalTo: 80)
        
        titleLabel.leadingAnchor(equalTo: contentImageView.trailingAnchor, constant: 16)
        titleLabel.centerYAnchor(equalTo: defaultView.centerYAnchor)
        
        defaultView.topAnchor(equalTo: topAnchor, constant: 16)
        defaultView.leadingAnchor(equalTo: leadingAnchor, constant: 16)
        defaultView.trailingAnchor(equalTo: trailingAnchor, constant: -16)
        defaultView.bottomAnchor(equalTo: bottomAnchor, constant: -16)
    }
    
    public func setupConfigurations() {
        selectionStyle = .none
    }
}
