//
//  UIView+Extension.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 09/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

extension UIView {
    func applyGradientBackground(colors: [CGColor]) {
        let gradient = CAGradientLayer()

        gradient.frame = bounds
        gradient.colors = colors

        layer.insertSublayer(gradient, at: 0)
    }
}
