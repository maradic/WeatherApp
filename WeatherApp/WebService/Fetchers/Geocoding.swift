//
//  Geocoding.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import Foundation

/**
 * https://trello.com/c/2BjA93dK/9-add-city-secreen
 * Implementation for search cities should done in 2 ways.
 * 1. Download list of cities (json) but that is pointless because it take more space, and adding
 *   cities is something users wont do often.
 *   This i found out from experiance users care about app sizes (dont know why but probably if i dont know i should consider myself happy :) )
 * 2. that why i think its better to go with geocoding api and use lat long as id
 * 3. when first time current weather data is fetched, for lat and lon query params, we can assign id to city and use https://openweathermap.org/api/one-call-api to save request numbers
 */
class Geocoding {
    
    class func geocode(name: String,
                       completion: @escaping ([GeocodingResponse]) -> ()) {
        APIClient.shared.makeRequest(router: .geocoding(cityName: name)) { (result: Result<[GeocodingResponse], ServiceError>) in
            switch result {
            case .success(let geocodingResponse):
                completion(geocodingResponse)
            case .failure(_):
                completion([])
            }
        }
    }
}
