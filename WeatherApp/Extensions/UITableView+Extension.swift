//
//  UITableView+Extension.swift
//  WeatherApp
//
//  Created by Marinko on 7/29/21.
//

import UIKit

extension UITableView {
    
    func removeSeparators() {
        tableFooterView = UIView()
    }
    
    func addEmptyStateMessageIfNeeded(message: String, count: Int) {
        if count == 0 {
            let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: self.bounds.size.width, height: self.bounds.size.height))
            let messageLabel = UILabel(frame: rect)
            messageLabel.text = message
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            
            backgroundView = messageLabel
        } else {
            backgroundView = nil
        }
    }
}
