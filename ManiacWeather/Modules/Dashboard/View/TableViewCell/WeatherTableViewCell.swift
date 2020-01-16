//
//  WeatherTableViewCell.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 12/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 14
            containerView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var currentWeatherImageView: UIImageView!
    @IBOutlet weak var currentWeatherDescription: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var date: UILabel!

    static var reuseIdentifier = "WeatherTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupFromWeather(weather: Weather) {
        currentWeatherDescription.text = weather.info?.first?.description
        if let temp = weather.main?.temp {
            temperature.text = String(temp) + "°"
        }
        location.text = weather.locationName
        if let unixTime = weather.unixTime {
            date.text = unixToDate(unixTime: unixTime).uppercased()
        }
        if let iconName = weather.info?.first?.icon {
            let downloadUrl = "https://openweathermap.org/img/wn/\(iconName)@2x.png"
            currentWeatherImageView?.loadImageUsingCache(withUrl: downloadUrl)
        }
    }

    // TODO: refactor this -> Maybe move this somewhere else
    private func unixToDate(unixTime: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(unixTime))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .full
        dateFormatter.dateFormat = "EEE dd"
        let localDate = dateFormatter.string(from: date).replacingOccurrences(of: " ", with: "\n")
        return localDate
    }

}

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImageUsingCache(withUrl urlString: String) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }

        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, _, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }

        }).resume()
    }
}
