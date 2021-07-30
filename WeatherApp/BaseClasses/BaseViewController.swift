//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Marinko on 7/30/21.
//

import UIKit


class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}

