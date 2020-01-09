
//
//  GradientBaseViewController.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 09/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

class GradientBackgroundBaseViewController: BaseViewController {
    
    var gradientBackgroundStartColor: CGColor {
        return UIColor.ManiacWeatherTheme.gradientBackgroundStartColor.cgColor
    }
    
    var gradientBackgroundEndColor: CGColor {
        return UIColor.ManiacWeatherTheme.gradientBackgroundEndColor.cgColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.applyGradientBackground(colors: [gradientBackgroundStartColor, gradientBackgroundEndColor])
    }
}
