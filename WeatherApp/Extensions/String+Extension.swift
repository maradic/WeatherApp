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
    
    var asUrl: URL? {
        return URL(string: self)
    }
    
    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    static let celsiusSign = "\u{2103}"
}
