//
//  GeocodingResponse.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import Foundation

struct GeocodingResponse: Codable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
    //ignore local_names for now
}
