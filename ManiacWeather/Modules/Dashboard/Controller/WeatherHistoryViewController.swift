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
    @IBOutlet weak var historyTableView: UITableView! {
        didSet {
            historyTableView.dataSource = self
            historyTableView.tableFooterView = UIView()
            historyTableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: WeatherTableViewCell.reuseIdentifier)
        }
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        weathers = UserDefaults.standard.value([Weather].self, forKey: "weatherList") ?? []
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customBackButton()
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
        cell?.setupFromWeather(weather: weathers[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
