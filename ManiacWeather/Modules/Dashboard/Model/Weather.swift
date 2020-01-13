//
//  Weather.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 11/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    var description: String?
    var main: WeatherMain?
    var unixTime: Int?
    var locationName: String?
    var iconName: String?

    private enum CodingKeys: String, CodingKey {
       case description, main, locationName = "name", unixTime = "dt", iconName = "icon"
    }
}

struct WeatherMain: Decodable {
    var temp: Int?
    var tempMin: Int?
    var tempMax: Int?

    private enum CodingKeys: String, CodingKey {
       case temp, tempMin = "temp_min", tempMax = "temp_max"
    }
}
