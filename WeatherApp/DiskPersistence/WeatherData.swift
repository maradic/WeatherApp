//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Marinko on 7/29/21.
//

import Foundation

class WeatherData: NSObject, NSCoding {
    var cities = [WeatherCity]()
    
    override init() {
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(cities, forKey: "cities")
    }
    
    required init?(coder: NSCoder) {
        cities = coder.decodeObject(forKey: "cities") as? [WeatherCity] ?? [WeatherCity]()
    }
}
