//
//  File.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 16/02/22.
//

import UIKit

extension UIImage {
    public static func settingsIcon() -> UIImage {
        UIImage(named: "SettingsIcon") ?? UIImage()
    }
    
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
        UIImage(named: "HealthContentsIcon") ?? UIImage()
    }
    
    public static func myMeasurements() -> UIImage {
        UIImage(named: "MyMeasurementsIcon") ?? UIImage()
    }
    
    public static func myExams() -> UIImage {
        UIImage(named: "MyExamsIcon") ?? UIImage()
    }
    
    public static func myAppointments() -> UIImage {
        UIImage(named: "MyAppointmentsIcon") ?? UIImage()
    }
    
    public static func myMedicines() -> UIImage {
        UIImage(named: "MyMedicinesIcon") ?? UIImage()
    }
    
    public static func medicinesConfiguration() -> UIImage {
        UIImage()
    }
    
    public static func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
