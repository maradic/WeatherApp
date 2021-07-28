//
//  ServiceError.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import Foundation

enum ServiceError : Error {
    case unknown //= 0
    case parseError
    case noNetwork //= 1000
    
    init(rawValue: Int) {
        switch rawValue {
        case 1000:
            self = .noNetwork
        default:
            self = .unknown
        }
    }
}
