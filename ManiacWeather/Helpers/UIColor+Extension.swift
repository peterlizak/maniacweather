//
//  UIColor+Extension.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 09/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

public extension UIColor {
    enum ManiacWeatherTheme {
        // Universal
        public static let white = UIColor.white
        // Dashboard
        public static let gradientBackgroundStartColor = UIColor(red:0.30, green:0.68, blue:0.61, alpha:1.0)
        public static let gradientBackgroundEndColor = UIColor(red:0.63, green:0.78, blue:0.33, alpha:1.0)
        public static let searchButtonTintColor = UIColor(red:0.38, green:0.72, blue:0.49, alpha:1.0)
        public static let historyButtonBackgroundColor = UIColor(red:0.56, green:0.78, blue:0.53, alpha:1.0)
        public static let locationTextFieldPlaceHolderColor = UIColor(red:0.62, green:0.78, blue:0.30, alpha:1.0)
    }
}
