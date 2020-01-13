//
//  EndPoint.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 11/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

struct EndPoint<T: Decodable> {
    var urlParameter: [String: String]?
    var jsonParameter: [String: Any]?
    var expectedResponseType: T.Type?
    var httpMethod: HTTPMethod = .get
    var path: String
    var api: APIType
}

extension EndPoint {
    func buildRequest<T: Decodable>(from route: EndPoint<T>) throws -> URLRequest {
        
        var request = URLRequest(url: route.api.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        
        if let urlParameter = route.urlParameter {
            do {
                try configureURlParameters(request: &request, urlParameters: urlParameter)
            } catch {
                print(error)
                throw error
            }
        }
        
        if let jsonParameter = route.jsonParameter {
            do {
                try configureJSONParameters(request: &request, jasonParameters: jsonParameter)
            } catch {
                print(error)
                throw error
            }
        }
        
        return request
    }
    
    private func configureURlParameters(request: inout URLRequest, urlParameters: Parameters) throws {
        do {
            try URLParameterEncoder().encode(urlRequest: &request, with: urlParameters)
        } catch {
            print(error)
          throw error
        }
    }

    private func configureJSONParameters(request: inout URLRequest, jasonParameters: Parameters) throws {
       do {
           try JSONParameterEncoder().encode(urlRequest: &request, with: jasonParameters)
       } catch {
         print(error)
         throw error
       }
    }
    
    private func addAdditionalHeaders(_ additionalHeaders: [String: String], request: inout URLRequest) {
        for (key, value) in additionalHeaders {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
