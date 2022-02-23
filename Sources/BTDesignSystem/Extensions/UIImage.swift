//
//  File.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 16/02/22.
//

import UIKit

extension UIImage {
    public static func device() -> UIImage {
        UIImage(named: "DevicesIcon") ?? UIImage()
    }
    
    public static func home() -> UIImage {
        UIImage(named: "MyHealthIcon") ?? UIImage()
    }
    
    public static func more() -> UIImage {
        UIImage(named: "MoreIcon") ?? UIImage()
    }
    
    public static func configs() -> UIImage {
        UIImage(named: "ConfigIcon") ?? UIImage()
    }
    
    public static func measurementHistory() -> UIImage {
        UIImage(named: "HistoryMeasurementIcon") ?? UIImage()
    }
    
    public static func profile() -> UIImage {
        UIImage(named: "ProfileIcon") ?? UIImage()
    }
    
    public static func forms() -> UIImage {
        UIImage(named: "FormsIcon") ?? UIImage()
    }
    
    public static func echOS() -> UIImage {
        UIImage(named: "EchOSIcon") ?? UIImage()
    }
    
    public static func healthContents() -> UIImage {
        UIImage()
    }
    
    public static func myMeasurements() -> UIImage {
        UIImage()
    }
    
    public static func myExams() -> UIImage {
        UIImage()
    }
    
    public static func myAppointments() -> UIImage {
        UIImage()
    }
    
    public static func myMedicines() -> UIImage {
        UIImage()
    }
    
    public static func medicinesConfiguration() -> UIImage {
        UIImage()
    }
}
