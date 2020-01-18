//
//  HTTPURLResponse+Extension.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 15/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    func handleNetworkResponse() -> HTTPResponseResult {
      switch statusCode {
      case 200...299: return .success
      case 400, 404: return .failure(NetworkResponse.badRequest.rawValue)
      case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
      case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
      case 600: return .failure(NetworkResponse.outdated.rawValue)
      default: return .failure(NetworkResponse.failed.rawValue)
      }
    }
}
