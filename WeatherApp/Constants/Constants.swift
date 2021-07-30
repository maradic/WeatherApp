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
    
    static let searchDebounceTime = 0.6
    static let defaultPlaceholder = "placeholder"
    static let undefinedWeatherDouble = -200.0
    static let undefinedWeatherInt = -200
}

enum Secrets {
    static let apiKey = "6a0f0731d84afa4082031e3a72354991"
}
