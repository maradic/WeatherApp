//
//  Geocoding.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import Foundation
import Alamofire

final class Geocoding {
    class func geocode(name: String,
                       completion: @escaping ([GeocodingResponse]) -> ()) {
        APIClient.shared.makeRequest(router: .geocoding(cityName: name)) { (result: Result<[GeocodingResponse], ServiceError>) in
            switch result {
            case .success(let geocodingResponse):
                break
            case .failure(let error):
                break
            }
        }
    }
}
