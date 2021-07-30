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
    var currentHumidity: Double = Constants.undefinedWeatherDouble
    var weatherDescription: String?
    var cityName: String
    
    var temperatureFrendly: String {
        if currentTemperature != Constants.undefinedWeatherDouble{
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
    }
    
    required init?(coder: NSCoder) {
        lat = coder.decodeDouble(forKey: "lat")
        long = coder.decodeDouble(forKey: "long")
        currentHumidity = coder.decodeDouble(forKey: "currentHumidity")
        weatherDescription = coder.decodeObject(forKey: "weatherDescription") as? String
        currentTemperature = coder.decodeDouble(forKey: "currentTemperature")
        cityName = coder.decodeObject(forKey: "cityName") as! String
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
    
//    override func hash(into hasher: inout Hasher) {
//        return hasher.combine(lat + long)
//    }

}
