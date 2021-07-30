//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Marinko on 7/30/21.
//

import Foundation

internal final class CurrentWeatherFetcher {
    
    class func getCurrentWeatherData(lat: Double, long: Double, completion:@escaping (CurrentWeatherResponse?, ServiceError?) -> Void) {
        APIClient.shared.makeRequest(router: .current(lat: lat, long: long)) { (result: Result<CurrentWeatherResponse, ServiceError>) in
            switch result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
