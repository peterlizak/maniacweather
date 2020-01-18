//
//  WeatherTableViewCell.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 12/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    // MARK: - UIObjects
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 14
            containerView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var date: UILabel!

    // MARK: - Properties
    static var reuseIdentifier = "WeatherTableViewCell"

    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Setup
    func setupFrom(weather: Weather) {
        weatherDescription.text = weather.info?.first?.description
        if let temp = weather.main?.roundedTemp {
            temperature.text = String(temp) + "°"
        }
        location.text = weather.locationName
        if let unixTime = weather.unixTime {
            date.text = unixTime.dateValue?.uppercased()
        }
        if let iconName = weather.info?.first?.icon {
            let downloadUrl = "https://openweathermap.org/img/wn/\(iconName)@2x.png"
            weatherImageView?.loadImageUsingCache(withUrl: downloadUrl, completion: nil)
        }
    }
}
