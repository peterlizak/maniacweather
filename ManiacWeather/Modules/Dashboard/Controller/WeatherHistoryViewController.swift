//
//  WeatherHistoryViewController.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 12/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

class WeatherHistoryViewController: GradientBackgroundBaseViewController {

    private var weathers: [Weather] = []
    private let weatherStorage = WeatherStorageManager()

    @IBOutlet weak var weatherHistoryTableView: UITableView! {
        didSet {
            weatherHistoryTableView.dataSource = self
            weatherHistoryTableView.tableFooterView = UIView()
            weatherHistoryTableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: WeatherTableViewCell.reuseIdentifier)
        }
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        weathers = weatherStorage.weatherHistory()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customBackButton()
        checkForEmptyData()
    }

    private func checkForEmptyData() {
        if weathers.isEmpty {
            weatherHistoryTableView.setEmptyMessage("Your searching history is empty")
        }
    }

    private func customBackButton() {
        let image = UIImage(named: "arrow-left")
        navigationController?.imageAsBackButtonItem(image: image, imageColor: UIColor.ManiacWeatherTheme.white)
    }
}

extension WeatherHistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.reuseIdentifier) as? WeatherTableViewCell
        cell?.setupFrom(weather: weathers[indexPath.row])
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            weathers = weatherStorage.removeWeather(weather: weathers[indexPath.row])
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            checkForEmptyData()
        }
    }
}
