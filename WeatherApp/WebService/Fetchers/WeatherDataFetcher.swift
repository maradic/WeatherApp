//
//  WeatherDataFetcher.swift
//  WeatherApp
//
//  Created by Marinko on 7/30/21.
//

import Foundation

class WeatherDataFetcher {
    
    class func fetchAllWeatherData(weatherData: inout WeatherData, completion:@escaping (Bool) -> Void) {
        let group = DispatchGroup()
        for city in weatherData.cities {
            group.enter()
            var weakCity: WeatherCity? = city
            
            CurrentWeatherFetcher.getCurrentWeatherData(lat: city.lat, long: city.long) { weatherData, error  in
                weakCity?.weatherData = weatherData
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            completion(true)
        }
    }
    
}
