//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Marinko on 7/30/21.
//

import Foundation

class CurrentWeatherResponse: NSObject, NSCoding, Codable {
    var main: MainWeatherData
    var temperature: Double {
        return main.temp
    }
    
    var humudity: Int {
        return main.humidity
    }
    
    var pressure: Int {
        return main.pressure
    }
    
//    enum CodingKeys: String, CodingKey {
//        case dataEntry = "main"
//    }
    
    func encode(with coder: NSCoder) {
        coder.encode(main, forKey: "dataEntry")
    }
    
    required init?(coder: NSCoder) {
        main = coder.decodeObject(forKey: "dataEntry") as! MainWeatherData
    }
    
}

class MainWeatherData: NSObject, NSCoding, Codable {
    var temp: Double
    var pressure: Int
    var humidity: Int
    
    func encode(with coder: NSCoder) {
        coder.encode(temp, forKey: "temp")
        coder.encode(pressure, forKey: "pressure")
        coder.encode(humidity, forKey: "humidity")
    }
    
    required init?(coder: NSCoder) {
        humidity = coder.decodeInteger(forKey: "humidity")
        pressure = coder.decodeInteger(forKey: "pressure")
        temp =  coder.decodeDouble(forKey: "temp")
    }
}
