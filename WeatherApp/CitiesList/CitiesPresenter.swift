//
//  CitiesPresenter.swift
//  WeatherApp
//
//  Created by Marinko on 7/29/21.
//

import Foundation

protocol CityPresenterDelegate: AnyObject {
    func refreshingStateChanged(isRefreshing: Bool)
}

class CitiesPresenter {
    var cities: [WeatherCity] {
        get {
            return WeatherManager.shared.weatherData.cities
        }
    }
    
    weak var delegate: CityPresenterDelegate?
    
    func deleteCity(cityAtIndex: Int) {
        WeatherManager.shared.deleteCity(city: cities[cityAtIndex])
    }
    
    func refreshData() {
        
    }
}
