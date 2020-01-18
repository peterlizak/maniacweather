//
//  WeatherDataManager.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 18/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

class WeatherStorageManager {

    private let weatherListLimit = 5
    private let userDefault = UserDefaults.standard
    private let weatherListKey = "weatherList"

    func saveData(weather: Weather) {
       var weatherList = retrieveWeatherHistoryFromUserDefaults()
       removeDuplicateData(weatherList: &weatherList, weather: weather)
       if weatherList.count == weatherListLimit {
           weatherList.remove(at: 0)
       }
       weatherList.append(weather)
       UserDefaults.standard.set(encodable: weatherList, forKey: weatherListKey)
    }

    func removeWeather(weather: Weather) -> [Weather] {
        var weatherList = retrieveWeatherHistoryFromUserDefaults()
        weatherList = weatherList.filter { $0.locationName != weather.locationName }
        UserDefaults.standard.set(encodable: weatherList, forKey: weatherListKey)

        return weatherList
    }

    func weatherHistory() -> [Weather] {
        return retrieveWeatherHistoryFromUserDefaults()
    }

    private func retrieveWeatherHistoryFromUserDefaults() -> [Weather] {
        var history = UserDefaults.standard.value([Weather].self, forKey: weatherListKey) ?? []
        history.reverse()

        return history
    }

    private func removeDuplicateData(weatherList: inout [Weather], weather: Weather) {
        weatherList = weatherList.filter { $0.locationName != weather.locationName }
    }
}
