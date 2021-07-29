//
//  Constants.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import Foundation

struct Constants {
    
    struct URL {
        
        static let weatherApiBaseStringURL = "https://api.openweathermap.org"
    }
    
    struct Animation {
        static let short = 0.2
    }
    
    static let searchDebounceTime = 1.0
    static let defaultPlaceholder = "placeholder"
}

enum Secrets {
    static let apiKey = "6a0f0731d84afa4082031e3a72354991"
}
