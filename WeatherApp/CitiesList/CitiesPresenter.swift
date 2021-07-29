//
//  CitiesPresenter.swift
//  WeatherApp
//
//  Created by Marinko on 7/29/21.
//

import Foundation

class CitiesPresenter {
    var cities: [WeatherCity] {
        get {
            return WeatherManager.shared.weatherData.cities
        }
    }
    
    func deleteCity(city: WeatherCity) {
        WeatherManager.shared.deleteCity(city: city)
    }
}
