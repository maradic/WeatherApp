//
//  CellConfigurator.swift
//  WeatherApp
//
//  Created by Marinko on 7/29/21.
//

import Foundation

class CellConfigurator {
    
    class func configureSearchCell(cell: SearchCityTableViewCell, geocode: GeocodingResponse) {
        cell.searchCityTitleLabel.text = geocode.name + ", \(geocode.country)"
    }
    
    class func configureCitiesCell(cell: CityTableViewCell, city: WeatherCity) {
        cell.searchCityTitleLabel.text = city.cityName
        if city.currentTemperature != Constants.undefinedWeatherDouble{
            cell.temperatureLabel.text = String(Int(city.currentTemperature)) + " " + "\u{2103}"
        } else {
            cell.temperatureLabel.text = "-- " + "\u{2103}"
        }
    }
}
