//
//  WeatherDataManager.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 18/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

class WeatherStorageManager {

    private let userDefault = UserDefaults.standard
    private let weatherListKey = "weatherList"

    func saveData(weather: Weather) {
       var weatherList = userDefault.value([Weather].self, forKey: weatherListKey) ?? []
       removeDuplicateData(weatherList: &weatherList, weather: weather)
       if weatherList.count == 5 {
           weatherList.remove(at: 0)
       }
       weatherList.append(weather)
       UserDefaults.standard.set(encodable: weatherList, forKey: weatherListKey)
    }

    func removeWeather(weather: Weather) -> [Weather] {
        var weatherList = userDefault.value([Weather].self, forKey: weatherListKey) ?? []
        weatherList = weatherList.filter { $0.locationName != weather.locationName }
        UserDefaults.standard.set(encodable: weatherList, forKey: weatherListKey)

        return weatherList
    }

    func weatherHistory() -> [Weather] {
        return UserDefaults.standard.value([Weather].self, forKey: weatherListKey) ?? []
    }

    private func removeDuplicateData(weatherList: inout [Weather], weather: Weather) {
        weatherList = weatherList.filter { $0.locationName != weather.locationName }
    }
}
