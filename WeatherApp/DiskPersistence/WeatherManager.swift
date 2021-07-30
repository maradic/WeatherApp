//
//  DiskManager.swift
//  WeatherApp
//
//  Created by Marinko on 7/29/21.
//

import Foundation

final class WeatherManager {
    static let shared = WeatherManager()
    
    var weatherData = WeatherData()
    
    init() {
        weatherData = DiskPersistence.retriveData() ?? WeatherData()
    }
    
    func addNewSelectedCity(cityGeocoding: GeocodingResponse) {
        let city = WeatherCity(lat: cityGeocoding.lat, long: cityGeocoding.lon, name: cityGeocoding.name)
        if !weatherData.cities.contains(where: {$0 == city}) {
            weatherData.cities.append(city)
            DiskPersistence.saveData(weatherData: weatherData)
        }
    }
    
    func deleteCity(city: WeatherCity) {
        weatherData.cities.removeAll(where: {$0 == city})
        DiskPersistence.saveData(weatherData: weatherData)
    }
}

struct DiskPersistence {
    static let weatherDataKey = "weatherData"
    
    static func saveData(weatherData: WeatherData)  {
        do {           
            let data = try NSKeyedArchiver.archivedData(withRootObject: weatherData, requiringSecureCoding: false)
            UserDefaults.standard.setValue(data, forKey: weatherDataKey)
            UserDefaults.standard.synchronize()
        } catch let error {
            debugPrint(error.localizedDescription)
        }       
    }
    
    static func retriveData() -> WeatherData? {
        var weatherData: WeatherData?
        do {
            guard let data = UserDefaults.standard.object(forKey: weatherDataKey) as? Data else {return nil}
            weatherData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? WeatherData
        } catch let error {
            debugPrint(error.localizedDescription)
        }
        
        return weatherData
    }
}



