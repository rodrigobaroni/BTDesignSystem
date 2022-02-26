//
//  BaseViewController.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 23/02/22.
//

import UIKit

public class BaseViewController<View>: UIViewController, UITableViewDelegate, UITableViewDataSource where View: UIView {
    
    public var associatedView: View? { return self.view as? View }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return BaseTableViewCell(view: View())
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public override func loadView() {
        super.loadView()
        self.view = BaseView(tableViewDelegate: self)
    }
    
}

class BaseView: UIView {
    
    lazy var baseTableView: UITableView = {
        let baseTableView = UITableView(frame: .zero, style: .grouped)
        
        baseTableView.separatorStyle = .none
        baseTableView.register(BaseTableViewCell.self, forCellReuseIdentifier: "BaseCell")
        baseTableView.rowHeight = UITableView.automaticDimension
        baseTableView.alwaysBounceVertical = false
        baseTableView.translatesAutoresizingMaskIntoConstraints = false
        baseTableView.delegate = tableViewDelegate
        baseTableView.dataSource = tableViewDelegate
        baseTableView.backgroundColor = .white
        
        return baseTableView
    }()
    
    private var tableViewDelegate: UITableViewDelegate & UITableViewDataSource
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(tableViewDelegate: UITableViewDelegate & UITableViewDataSource) {
        self.tableViewDelegate = tableViewDelegate
        super.init(frame: .zero)
        setupView()
    }
}

extension BaseView: BTViewCode {
    
    func setupHierarchy() {
        addSubview(baseTableView)
    }
    
    func setupConstraints() {
        baseTableView.topAnchor(equalTo: self.topAnchor)
        baseTableView.bottomAnchor(equalTo: self.bottomAnchor)
        baseTableView.leadingAnchor(equalTo: self.leadingAnchor)
        baseTableView.trailingAnchor(equalTo: self.trailingAnchor)
    }
    
    func setupConfigurations() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

class BaseTableViewCell: UITableViewCell {
    
    private var baseView: UIView
    
    init(view: UIView) {
        baseView = view
        super.init(style: .default, reuseIdentifier: "BaseCell")
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BaseTableViewCell: BTViewCode {
    
    func setupHierarchy() {
        addSubview(baseView)
    }
    
    func setupConstraints() {
        baseView.topAnchor(equalTo: self.topAnchor)
        baseView.bottomAnchor(equalTo: self.bottomAnchor)
        baseView.leadingAnchor(equalTo: self.leadingAnchor)
        baseView.trailingAnchor(equalTo: self.trailingAnchor)
    }
    
    func setupConfigurations() {
        baseView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
