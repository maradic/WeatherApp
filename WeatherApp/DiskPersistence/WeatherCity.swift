//
//  WeatherCity.swift
//  WeatherApp
//
//  Created by Marinko on 7/29/21.
//

import Foundation

class WeatherCity: NSObject, NSCoding {
    let lat: Double
    let long: Double
    var currentTemperature: Double = Constants.undefinedWeatherDouble
    var currentHumidity: Int = Constants.undefinedWeatherInt
    var weatherDescription: String?
    var cityName: String
    var weatherData: CurrentWeatherResponse? {
        didSet {
            if let weatherData = weatherData {
                currentTemperature = weatherData.temperature
                currentHumidity = weatherData.humudity
            }
        }
    }
    
    var temperatureFrendly: String {
        if currentTemperature != Constants.undefinedWeatherDouble {
            return String(Int(currentTemperature)) + " " + String.celsiusSign
        } else {
            return "-- " + String.celsiusSign
        }
    }
    
    init(lat: Double, long: Double, name: String) {
        self.lat = lat
        self.long = long
        self.cityName = name
    }
    
    func encode(with coder: NSCoder) {        
        coder.encode(lat, forKey: "lat")
        coder.encode(long, forKey: "long")
        coder.encode(cityName, forKey: "cityName")
        coder.encode(currentHumidity, forKey: "currentHumidity")
        coder.encode(weatherDescription, forKey: "weatherDescription")
        coder.encode(currentTemperature, forKey: "currentTemperature")
        if let weatherData = weatherData {
            coder.encode(weatherData, forKey: "weatherData")
        }
    }
    
    required init?(coder: NSCoder) {
        lat = coder.decodeDouble(forKey: "lat")
        long = coder.decodeDouble(forKey: "long")
        currentHumidity = coder.decodeInteger(forKey: "currentHumidity")
        weatherDescription = coder.decodeObject(forKey: "weatherDescription") as? String
        currentTemperature = coder.decodeDouble(forKey: "currentTemperature")
        cityName = coder.decodeObject(forKey: "cityName") as! String
        weatherData = coder.decodeObject(forKey: "weatherData") as? CurrentWeatherResponse
    }
    
    static func == (lhs: WeatherCity, rhs: WeatherCity) -> Bool{
        return
            lhs.lat == rhs.lat &&
            lhs.long == rhs.long
    }
    
    func isEqual(_ object: WeatherCity?) -> Bool {
        guard let object = object else { return false}
        return
            lat == object.lat &&
            long == object.long
    }
        
    override var hash: Int {
        get {
            return (lat + long).hashValue
        }
    }
    
}
