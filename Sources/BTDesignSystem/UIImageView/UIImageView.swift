//
//  UIImageView.swift
//  
//
//  Created by Fellipe thufik Costa Gomes Hoashi on 23/12/21.
//

import UIKit

public class HeaderImageView: UIImageView {
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        image = UIImage(named: "headerImage")
    }
}

public class FacebookImageView: UIImageView {
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        image = UIImage(named: "facebookImage")
    }
}

public class GoogleImageView: UIImageView {
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        image = UIImage(named: "googleImage")
    }
}

public class EmailSentSuccessImageView: UIImageView {
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        contentMode = .scaleAspectFit
        
        image = UIImage(named: "emailSentSuccessImage")
    }
}
