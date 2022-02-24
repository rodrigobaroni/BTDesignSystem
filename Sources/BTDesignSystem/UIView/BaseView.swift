//
//  BaseView.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 23/02/22.
//

import UIKit

public class BaseView: UIView {

    required init?(coder: NSCoder) {
        nil
    }
    
    public lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    public lazy var contentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    public init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    public func addContentView(view: UIView) {
        contentView.addSubview(view)
        
        view.topAnchor(equalTo: contentView.topAnchor)
        view.leadingAnchor(equalTo: contentView.leadingAnchor)
        view.trailingAnchor(equalTo: contentView.trailingAnchor)
        view.bottomAnchor(equalTo: contentView.bottomAnchor)
        
        scrollView.addSubview(contentView)
        
        contentView.centerXAnchor(equalTo: scrollView.centerXAnchor)
        contentView.widthAnchor(equalTo: scrollView.widthAnchor)
        //contentView.heightAnchor(equalTo: scrollView.heightAnchor)
        contentView.topAnchor(equalTo: scrollView.topAnchor)
        contentView.bottomAnchor(equalTo: scrollView.bottomAnchor)
        contentView.leadingAnchor(equalTo: scrollView.leadingAnchor)
        contentView.trailingAnchor(equalTo: scrollView.trailingAnchor)
    }
}

extension BaseView: BTViewCode {
    public func setupHierarchy() {
        addSubview(scrollView)
        
        
    }
    
    public func setupConstraints() {
        scrollView.centerYAnchor(equalTo: centerYAnchor)
        scrollView.centerXAnchor(equalTo: centerXAnchor)
        scrollView.widthAnchor(equalTo: widthAnchor)
        scrollView.topAnchor(equalTo: topAnchor)
        scrollView.bottomAnchor(equalTo: bottomAnchor)
    }
    
    public func setupConfigurations() {
        backgroundColor = .white
    }
}
