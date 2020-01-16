//
//  APIService.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 11/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

class APIService {
    static let shared = APIService()
    private var task: URLSessionTask?

    func perform<T>(endPoint: EndPoint<T>, completion: @escaping (_ success: Bool, _ data: T?, _ error: APIServiceError?) -> Void) {
        let session = URLSession.shared
        do {
           let request = try endPoint.buildRequest(from: endPoint)
           task = session.dataTask(with: request, completionHandler: { data, response, error in
                if let response = response as? HTTPURLResponse {
                    // TODO: Check for endPoint.expectedStatusCode
                    let result = response.handleNetworkResponse()
                    switch result {
                    case .success:
                        if endPoint.expectedResponseType == nil {
                            completion(true, nil, nil)
                            return
                        }
                        guard let responseData = data else {
                            completion(false, nil, APIServiceError(code: response.statusCode, description: NetworkResponse.noData.rawValue))
                           return
                        }
                        do {
                            let apiResponse = try JSONDecoder().decode(endPoint.expectedResponseType!.self, from: responseData)
                             completion(true, apiResponse, nil)
                        } catch {
                             print(error)
                             completion(false, nil, APIServiceError(code: response.statusCode, description: NetworkResponse.unableToDecode.rawValue))
                        }
                    case .failure(let networkFailureError):
                       completion(false, nil, APIServiceError(code: response.statusCode, description: networkFailureError))
                    }
                } else {
                    completion(false, nil, APIServiceError(code: nil, description: NetworkResponse.unableToParseURLResponse.rawValue))
                }
           })
        } catch {
            print(error)
            completion(false, nil, APIServiceError(code: nil, description: NetworkResponse.unableToBuildRequest.rawValue))
        }
        self.task?.resume()
    }

    func cancel() {
        self.task?.cancel()
    }
}
