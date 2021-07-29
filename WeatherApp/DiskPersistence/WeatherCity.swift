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
    var currentTemperature: Double?
    var currentHumidity: Double?
    var weatherDescription: String?
    
    init(lat: Double, long: Double) {
        self.lat = lat
        self.long = long
    }
    
    func encode(with coder: NSCoder) {        
        coder.encode(lat, forKey: "lat")
        coder.encode(long, forKey: "long")
        if let currentHumidity = currentHumidity {
            coder.encode(currentHumidity, forKey: "currentHumidity")
        }
        if let weatherDescription = weatherDescription {
            coder.encode(weatherDescription, forKey: "weatherDescription")
        }
        if let currentTemperature = currentTemperature {
            coder.encode(currentTemperature, forKey: "currentTemperature")
        }
    }
    
    required init?(coder: NSCoder) {
        lat = coder.decodeDouble(forKey: "lat")
        long = coder.decodeDouble(forKey: "long")
        currentHumidity = coder.decodeDouble(forKey: "currentHumidity")
        weatherDescription = coder.decodeObject(forKey: "weatherDescription") as? String
        currentTemperature = coder.decodeDouble(forKey: "currentTemperature")
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
