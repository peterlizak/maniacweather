//
//  Weather.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 11/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

struct Weather: Codable {
    var main: WeatherMain?
    var unixTime: Int?
    var locationName: String?
    var info: [WeatherInfo]?

    private enum CodingKeys: String, CodingKey {
       case locationName = "name", unixTime = "dt", info = "weather"
    }
}

struct WeatherInfo: Codable {
    var description: String?
    var icon: String?
}

struct WeatherMain: Codable {
    var temp: Float?
    var tempMin: Float?
    var tempMax: Float?

    private enum CodingKeys: String, CodingKey {
       case tempMin = "temp_min", tempMax = "temp_max"
    }
}
