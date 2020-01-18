//
//  Int+Extension.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 18/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

extension Int {

    var dateValue: String? {
        if self < 1_000_000_000 { return nil }
        let date = Date(timeIntervalSince1970: Double(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .full
        dateFormatter.dateFormat = "EEE dd"
        let localDate = dateFormatter.string(from: date).replacingOccurrences(of: " ", with: "\n")
        return localDate
    }

}
