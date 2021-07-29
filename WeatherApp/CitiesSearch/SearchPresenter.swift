//
//  SearchHelper.swift
//  WeatherApp
//
//  Created by Marinko on 7/29/21.
//

import Foundation
import Alamofire

protocol SearchDelegate: AnyObject {
    func searchResultUpdated()
    func showFinishButton(shouldShow: Bool)
}

/**
 * This class was implemented to debounce search but open weather map does not support
 * search suggestion if its not literal (almost)
 */
final class SearchPresenter {
    //public
    weak var delegate: SearchDelegate?
    var cities = [GeocodingResponse]()
    private var selectedCity: GeocodingResponse?
    
    private var currentSearchApiRequest: DataRequest?
    //debouncer, TODO move it
    private var timer: Timer?
    
    func searchCities(cityName: String?) {
        timer?.invalidate()
        delegate?.showFinishButton(shouldShow: false)
        currentSearchApiRequest?.cancel()
        if let cityName = cityName {
            let trimmed = cityName.trimmed
            guard trimmed.count > 0 else { return }
            timer = Timer.scheduledTimer(withTimeInterval: Constants.searchDebounceTime, repeats: false) { [weak self] timer in
                self?.executeApiRequest(cityName: trimmed)
            }
        }
    }
    
    private func executeApiRequest(cityName: String) {
        debugPrint("executeAPIRequest")
        Geocoding.geocode(name: cityName) { [weak self] citiesList in
            self?.cities = citiesList
            self?.delegate?.searchResultUpdated()
        }
    }
    
    func citySelected(index: Int) {
        delegate?.showFinishButton(shouldShow: true)
        selectedCity = cities[index]
    }
    
    func finishButtonTapped() {
        if let city = selectedCity {
            WeatherManager.shared.addNewSelectedCity(cityGeocoding: city)
        }        
    }
}
