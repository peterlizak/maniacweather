//
//  Dictionary+Extension.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 18/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]) {
        for (key, value) in dict {
            updateValue(value, forKey: key)
        }
    }
}
