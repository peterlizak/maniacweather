//
//  APIService.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 11/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

public typealias APIServiceCompletion = (_ success: Bool, _ data: Decodable?,_ error: String?)->()

enum Result {
    case success
    case failure(String)
}

class APIService {
    static let shared = APIService()
    private var task: URLSessionTask?
    
    func perform<T>(endPoint: EndPoint<T>, completion: @escaping (_ success: Bool, _ data: T?,_ error: String?)->()) {
        let session = URLSession.shared
        do {
           let request = try endPoint.buildRequest(from: endPoint)
           task = session.dataTask(with: request, completionHandler: { data, response, error in
                if let response = response as? HTTPURLResponse {
                    let result = response.handleNetworkResponse()
                    switch result {
                    case .success:
                        if endPoint.expectedResponseType == nil {
                            completion(true, nil, nil)
                            return
                        }
                        guard let responseData = data else {
                           completion(false, nil, NetworkResponse.noData.rawValue)
                           return
                        }
                        do {
                            let apiResponse = try JSONDecoder().decode(endPoint.expectedResponseType!.self, from: responseData)
                             completion(true, apiResponse,nil)
                        } catch {
                             print(error)
                             completion(false, nil, NetworkResponse.unableToDecode.rawValue)
                        }
                    case .failure(let networkFailureError):
                       completion(false, nil, networkFailureError)
                    }
                } else {
                    completion(false, nil, NetworkResponse.unableToParseURLResponse.rawValue)
                }
           })
        } catch {
            print(error)
            completion(false, nil, NetworkResponse.unableToBuildRequest.rawValue)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
}

extension HTTPURLResponse {
    func handleNetworkResponse() -> Result{
      switch statusCode {
       case 200...299: return .success
       case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
       case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
       case 600: return .failure(NetworkResponse.outdated.rawValue)
       default: return .failure(NetworkResponse.failed.rawValue)
      }
    }
}
