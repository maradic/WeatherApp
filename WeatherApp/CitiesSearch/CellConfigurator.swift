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
        cell.temperatureLabel.text = city.temperatureFrendly       
    }
}
