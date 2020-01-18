//
//  DashboardViewController.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 09/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

class DashboardViewController: GradientBackgroundBaseViewController {

    // MARK: - Properties
    private var defaultCornerRadius: CGFloat = 14.0
    private let dashboardService = DashboardService()
    private let weatherStorage = WeatherStorageManager()
    private var weather: Weather?

    // MARK: - UI Objects
    @IBOutlet private weak var inputContainerView: UIView!
    @IBOutlet private weak var searchButton: UIButton! {
        didSet {
            searchButton.roundCorners(corners: [.topRight, .bottomRight], radius: defaultCornerRadius)
            if let image = UIImage(named: "arrow-right") {
                searchButton.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
                searchButton.tintColor = UIColor.ManiacWeatherTheme.searchButtonTintColor
            }
        }
    }

    @IBOutlet private weak var locationInputField: UITextField! {
        didSet {
            locationInputField.roundCorners(corners: [.topLeft, .bottomLeft], radius: defaultCornerRadius)

            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: locationInputField.frame.height))
            locationInputField.leftView = leftView
            locationInputField.leftViewMode = .always

            locationInputField.attributedPlaceholder = NSAttributedString(string: "Location name".uppercased(),
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.ManiacWeatherTheme.locationTextFieldPlaceHolderColor])
        }
    }

    @IBOutlet private weak var historyButton: UIButton! {
        didSet {
            historyButton.backgroundColor = UIColor.ManiacWeatherTheme.historyButtonBackgroundColor
            historyButton.layer.cornerRadius = defaultCornerRadius
            historyButton.layer.masksToBounds = false

            historyButton.setTitle("View History".uppercased(), for: .normal)
            historyButton.setTitleColor(.black, for: .highlighted)
        }
    }

    // MARK: - Overides
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.transparentBackground()
        hideKeyboardWhenTappedAround()
    }

    // MARK: - Actions
    @IBAction private func searchButtonClicked(_ sender: Any) {
        if let locationName = locationInputField.text, !locationName.isEmpty {
            fetchWeatherFor(location: locationName)
        } else {
            self.showInfo(infoString: "Please enter location name")
        }
    }

    @IBAction private func historyButtonClicked(_ sender: Any) {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.pushViewController(WeatherHistoryViewController(), animated: true)
        }
    }

    // MARK: - Services
    private func fetchWeatherFor(location: String) {
        dashboardService.weatherFor(location: location, completionBlock: { [weak self] weather, error in
            if let weather = weather {
                self?.weather = weather
                self?.weatherStorage.saveData(weather: weather)
            } else if let errorString = error {
                self?.showError(errorString: errorString)
            }
        })
    }
}
