//
//  UserDefaults+Extension.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 14/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import Foundation

extension UserDefaults {

    func set<T: Encodable>(encodable: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key)
        }
    }

    func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data,
            let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }
}
