//
//  GradientBaseViewController.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 09/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

class GradientBackgroundBaseViewController: BaseViewController {

    private var gradientBackgroundStartColor: CGColor {
        return UIColor.ManiacWeatherTheme.gradientBackgroundStartColor.cgColor
    }

    private var gradientBackgroundEndColor: CGColor {
        return UIColor.ManiacWeatherTheme.gradientBackgroundEndColor.cgColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.applyGradientBackground(colors: [gradientBackgroundStartColor, gradientBackgroundEndColor])
    }
}
