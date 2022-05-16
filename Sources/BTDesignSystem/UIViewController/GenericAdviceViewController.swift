//
//  ErrorViewController.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 01/04/22.
//

import UIKit

class GenericAdviceViewController: UIViewController {

    private lazy var genericAdviceView = GenericAdviceView(descriptionText: descriptionText, type: type)
    
    private let type: AdviceType
    
    private let descriptionText: String
    
    private let completionHandler: (() -> Void)?
    
    required init?(coder: NSCoder) {
        nil
    }
    
    init(type: AdviceType, descriptionText: String = "Adicionado com sucesso!", completionHandler: (() -> Void)? = nil) {
        self.type = type
        self.descriptionText = descriptionText
        self.completionHandler = completionHandler
        
        super.init(nibName: nil, bundle: nil)
        
        self.isModalInPresentation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genericAdviceView.backButton.addTarget(self, action: #selector(clickBackButton), for: .touchUpInside)
    }
    
    override func loadView() {
        view = genericAdviceView
    }
    
    @objc private func clickBackButton() {
        dismiss(animated: true, completion: completionHandler)
    }
}
