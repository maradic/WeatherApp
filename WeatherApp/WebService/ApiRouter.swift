//
//  ApiRouter.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String? { get }
    var parameters: Parameters? { get }
}

private struct RouteVersion {
    static let data = "2.5"
    static let geo = "1.0"
}

private enum IncludeQueryParam {
    case current
    case minutely
    case hourly
    case daily
    case alerts
    
//    var exludeString: String {
//        return 
//    }
}

private struct Routes {
    static let onecallRoute = "/onecall/" + RouteVersion.data
    static let currentRoute = "/weather/" + RouteVersion.data
    static let daily16Route = "/daily/" + RouteVersion.data
    static let geocodingRoute = "/geo/" + RouteVersion.geo + "/direct"
}

enum APIRouter: APIConfiguration {
    case daily16hourd
    case onecall(lat: String, long: String)
    case geocoding(cityName: String)
    
    internal var method: HTTPMethod {
        switch self {
        default:
            return .get
        }        
    }
    
    internal var path: String? {
        switch self {
        case .geocoding:
            return Routes.geocodingRoute
        case .onecall:
            return Routes.onecallRoute
        case .daily16hourd:
            return Routes.daily16Route
        }
    }
    
    // MARK: Parameters
    
    internal var parameters: Parameters? {
        var parameters = [String: String]()
        switch self {
        case .geocoding(let cityName):
            parameters["q"] = cityName
            
        case .onecall(let lat, let long):
            parameters["lat"] = lat
            parameters["long"] = long
        case .daily16hourd: break
            
        }
        
        return parameters
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let baseUrl = Constants.URL.weatherApiBaseStringURL.asUrl!
    
        var urlRequest: URLRequest
        
        //MARK: Headers
        let headers: HTTPHeaders = [.accept("application/json"), .contentType("application/json")]
        
        if let param = parameters {
            var queryItems = param.map({ key, value in
            return URLQueryItem(name: key, value: value as! String)
            })
            do {
                queryItems.append(URLQueryItem(name: "appid", value: try Configuration.value(for: "API_KEY")))

            } catch {
                print(error)
            }
            var components = URLComponents(string: baseUrl.appendingPathComponent(path!).absoluteString)
            components?.queryItems = queryItems
            urlRequest = URLRequest(url: components!.url!)
        } else {
            urlRequest = URLRequest(url: baseUrl.appendingPathComponent(path!))
        }
        
        urlRequest.method = method
        urlRequest.headers = headers
        
        return urlRequest
    }
}
