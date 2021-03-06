//
//  DashboardService.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 11/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

class DashboardService {
    private static let weatherForLocationPath = "data/2.5/weather"
    private static let weatherForLocationMethod = HTTPMethod.get

    func weatherFor(location: String, completionBlock: @escaping (Weather?, String?) -> Void) {
        let urlParameter = ["q": location, "units": "metric"]
        let endPoint = EndPoint<Weather>(urlParameter: urlParameter,
                                         expectedResponseType: Weather.self,
                                         expectedResponseCode: 200,
                                         path: DashboardService.weatherForLocationPath,
                                         api: .weather)
        APIService.shared.perform(endPoint: endPoint, completion: { success, data, error  in
            if success {
                completionBlock(data, nil)
            } else {
                if error?.code == 404 {
                    completionBlock(nil, "Please enter a valid location")
                } else {
                    completionBlock(nil, error?.description)
                }
            }
        })
    }
}
