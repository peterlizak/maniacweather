//
//  APIType.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 12/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

enum APIType {
    case weather
}

extension APIType {
    var baseURL: URL {
        switch environment {
        case .production:
           return URL(fileURLWithPath: "https://api.openweathermap.org")
        }
    }
    // TODO: Environment should be determined by Scheme or by global flag
    var environment: NetworkEnvironment {
        return .production
    }
}
