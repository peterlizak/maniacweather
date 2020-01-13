//
//  WeatherHistoryViewController.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 12/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

class WeatherHistoryViewController: GradientBackgroundBaseViewController {

    private let testWeatherArray: [Weather] = [Weather(description: "Fog", main: WeatherMain(temp: 4, tempMin: 4, tempMax: 4), unixTime: 1578863104, locationName: "Kosice"),
                                               Weather(description: "Clouds", main: WeatherMain(temp: -12, tempMin: 4, tempMax: 4), unixTime: 3, locationName: "Oslo")]
    @IBOutlet weak var historyTableView: UITableView! {
        didSet {
            historyTableView.dataSource = self
            historyTableView.tableFooterView = UIView()
            historyTableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: WeatherTableViewCell.reuseIdentifier)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        customBackButton()
    }

    private func customBackButton() {
        let image = UIImage(named: "arrow-right")
        navigationController?.imageAsBackButtonItem(image: image, imageColor: UIColor.ManiacWeatherTheme.white)
    }
}

extension WeatherHistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testWeatherArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.reuseIdentifier) as? WeatherTableViewCell
        cell?.setupFromWeather(weather: testWeatherArray[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
