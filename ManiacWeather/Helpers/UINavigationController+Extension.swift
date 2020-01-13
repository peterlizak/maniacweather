//
//  UINavigationController+Extension.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 12/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

extension UINavigationController {
    func transparentBackground() {
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
    
    func imageAsBackButtonItem(image: UIImage?, imageColor: UIColor?) {
        guard let image = image else { return }
        navigationBar.backIndicatorImage = image.withRenderingMode(.alwaysTemplate)
        navigationBar.backIndicatorTransitionMaskImage = image
        let barButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        barButtonItem.tintColor = UIColor.ManiacWeatherTheme.white
        navigationBar.topItem?.backBarButtonItem = barButtonItem
    }
}
