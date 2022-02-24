//
//  BaseViewController.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 23/02/22.
//

import UIKit

open class BaseViewController: UIViewController {
    
    public let baseView = BaseView()
    
    open override func loadView() {
        view = baseView
    }

    open func addContentView(view: UIView){
        baseView.addContentView(view: view)
    }
}
