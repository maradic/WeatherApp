//
//  WebService.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import Foundation
import Alamofire

internal class APIClient {
    
    static let shared: APIClient = APIClient()
    private let decoder = JSONDecoder()
    private let session: Session = Session.default
    
    @discardableResult
    func makeRequest<T: Codable>(router: APIRouter, completion: @escaping (Result<T, ServiceError>) -> Void) -> DataRequest {
        return session.request(router).validate().responseData { (responseData) in
            debugPrint(responseData)
            switch responseData.result {
            case .success(let data):
                if let responseObject = try? self.decoder.decode(T.self, from: data) {
                    completion(.success(responseObject))
                } else {
                    completion(.failure(.parseError))
                }
            case .failure: //.failure(let error)
                completion(.failure(.unknown)) //make error handler later
            }
        }
    }
    
    @discardableResult
    func makeRequest(router: APIRouter, completion: @escaping (Result<Any, ServiceError>) -> Void ) -> DataRequest {
        return session.request(router).validate().responseJSON { (response) in
            switch response.result {
            case .success(let responseJson):
                completion(.success(responseJson))
            case .failure(let error):
                debugPrint(error.localizedDescription)
                completion(.failure(.unknown))
            }
        }
    }
}
