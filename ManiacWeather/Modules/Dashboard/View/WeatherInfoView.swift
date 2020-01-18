//
//  WeatherInfoView.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 18/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

class WeatherInfoView: UIView, XibLoadable {
    @IBOutlet var contentView: UIView! {
        didSet {
           contentView.layer.cornerRadius = 14
           contentView.layer.masksToBounds = false
        }
    }

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var temperature: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        initFromNib()
    }

    func setupFrom(weather: Weather) {
        location.text = weather.locationName
        if let temp = weather.main?.roundedTemp {
            temperature.text = String(temp) + "°"
        }
        if let iconName = weather.info?.first?.icon {
            let downloadUrl = "https://openweathermap.org/img/wn/\(iconName)@2x.png"
            weatherImageView?.loadImageUsingCache(withUrl: downloadUrl, completion: nil)
        }
    }
}
