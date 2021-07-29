//
//  UIColor+Extension.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        let finalRed: CGFloat = CGFloat(red) / 255.0
        let finalGreen: CGFloat = CGFloat(green) / 255.0
        let finalBlue: CGFloat = CGFloat(blue) / 255.0
        
        self.init(red: finalRed, green: finalGreen, blue: finalBlue, alpha: alpha)
    }
    
    static var defaultColor: UIColor {
        return .orange
    }
    
    static var defaultButtonTitleColor: UIColor {
        return .white
    }
    
    static var finishButtonColor: UIColor {
        return .green
    }
}
