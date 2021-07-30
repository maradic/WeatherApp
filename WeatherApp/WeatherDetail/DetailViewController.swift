//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Marinko on 7/30/21.
//

import UIKit

class DetailViewController: BaseViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var cityData: WeatherCity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }
    
    private func populateData() {
        cityLabel.text = cityData.cityName
        temperatureLabel.text = cityData.temperatureFrendly
        descriptionLabel.text = cityData.weatherDescription
    }
}
