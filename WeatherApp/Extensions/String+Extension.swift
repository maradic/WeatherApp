//
//  String+Extension.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
