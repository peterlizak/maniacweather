//
//  DashboardService.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 11/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

class DashboardService {
    private static let weatherForCityPath = "data/2.5/weather"
    private static let weatherForCityMethod = HTTPMethod.get

    func weatherFor(location: String, completionBlock: @escaping (Weather?, String?) -> Void) {
        let urlParameter = ["q": location, "APPID": "7587eaff3affbf8e56a81da4d6c51d06"]
        let endPoint = EndPoint<Weather>(urlParameter: urlParameter,
                                         expectedResponseType: Weather.self,
                                         path: DashboardService.weatherForCityPath,
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
