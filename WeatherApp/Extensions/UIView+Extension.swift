//
//  UIView+Extension.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import UIKit

extension UIView {
    
    func addBottomShadow(blur: CGFloat, ySpread: CGFloat, opacity: CGFloat = 0.25, color: UIColor = .black) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: ySpread)
        layer.shadowRadius = blur
        layer.shadowOpacity = Float(opacity)
        layer.masksToBounds = false
        layer.borderColor = UIColor.clear.cgColor
    }
    
}
