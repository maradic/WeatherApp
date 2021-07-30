//
//  UIStoryboard+Extension.swift
//  WeatherApp
//
//  Created by Marinko on 7/30/21.
//

import UIKit

extension UIStoryboard {
    static var weatherDetailViewController: DetailViewController {
            return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "DetailViewController")
    }
}
