//
//  HTTPURLResponse+Extension.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 15/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

extension HTTPURLResponse {

    func handleNetworkResponse(expectedResponseCode: Int?) -> HTTPResponseResult {
        if statusCode == expectedResponseCode { return .success}
        switch statusCode {
        case 200...299:
        if expectedResponseCode != nil {
            return .failure(HTTPResponseDescription.wrongStatusCode.rawValue)
        } else {
            return .success
        }
        case 400, 404: return .failure(HTTPResponseDescription.badRequest.rawValue)
        case 401...500: return .failure(HTTPResponseDescription.authenticationError.rawValue)
        case 501...599: return .failure(HTTPResponseDescription.badRequest.rawValue)
        case 600: return .failure(HTTPResponseDescription.outdated.rawValue)
        default: return .failure(HTTPResponseDescription.failed.rawValue)
      }
    }
    
}
