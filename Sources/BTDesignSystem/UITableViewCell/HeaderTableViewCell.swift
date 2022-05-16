//
//  HeaderTableViewCell.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 24/02/22.
//

import UIKit

public protocol HeaderTableViewCellActions {
    func select(row: Int)
}

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
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapRightImageGestureRecognizer)
        
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
    
    private lazy var tapRightImageGestureRecognizer: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self, action: #selector(tapRightImage))
    }()
    
    private lazy var titleLabel = MediumTextLabel(text: title)
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private let title: String
    
    private let row: Int
    
    private let hasRightImage: Bool
    
    private let viewContent: UIView
    
    private let delegate: HeaderTableViewCellActions?
    
    public init(title: String, row: Int, hasRightImage: Bool = false, viewContent: UIView, delegate: HeaderTableViewCellActions?) {
        self.title = title
        self.row = row
        self.hasRightImage = hasRightImage
        self.viewContent = viewContent
        self.delegate = delegate
        
        super.init(style: .default, reuseIdentifier: nil)
        
        setupView()
    }
    
    @objc private func tapRightImage() {
        delegate?.select(row: row)
    }
}

extension HeaderTableViewCell:  BTViewCode {
    public func setupHierarchy() {
        contentView.addSubview(headerView)
        contentView.addSubview(bodyView)
        
        headerView.addSubview(titleLabel)
        bodyView.addSubview(viewContent)
        
        if hasRightImage {
            headerView.addSubview(rightHeaderImageView)
        }
    }
    
    public func setupConstraints() {
        headerView.topAnchor(equalTo: contentView.topAnchor)
        headerView.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 16)
        headerView.trailingAnchor(equalTo: contentView.trailingAnchor, constant: -16)
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
        bodyView.leadingAnchor(equalTo: contentView.leadingAnchor, constant: 16)
        bodyView.trailingAnchor(equalTo: contentView.trailingAnchor, constant: -16)
        bodyView.bottomAnchor(equalTo: contentView.bottomAnchor, constant: -16)
        
        viewContent.topAnchor(equalTo: bodyView.topAnchor, constant: 16)
        viewContent.leadingAnchor(equalTo: bodyView.leadingAnchor, constant: 16)
        viewContent.trailingAnchor(equalTo: bodyView.trailingAnchor, constant: -16)
        viewContent.bottomAnchor(equalTo: bodyView.bottomAnchor, constant: -16)
    }
    
    public func setupConfigurations() {
        selectionStyle = .none
    }
}
