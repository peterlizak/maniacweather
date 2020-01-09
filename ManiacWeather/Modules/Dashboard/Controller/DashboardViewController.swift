//
//  DashboardViewController.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 09/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

class DashboardViewController: GradientBackgroundBaseViewController {

    private var defaultCornerRadius: CGFloat = 14.0
    @IBOutlet private weak var inputContainerView: UIView!
    @IBOutlet private weak var searchButton: UIButton! {
        didSet {
            searchButton.roundCorners(corners: [.topRight,.bottomRight], radius: defaultCornerRadius)
            if let image = UIImage(named: "arrow-right") {
                searchButton.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
                searchButton.tintColor = UIColor.ManiacWeatherTheme.searchButtonTintColor
            }
        }
    }
    @IBOutlet private weak var locationInputField: UITextField! {
        didSet {
            locationInputField.roundCorners(corners: [.topLeft,.bottomLeft], radius: defaultCornerRadius)
            
            let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: locationInputField.frame.height))
            locationInputField.leftView = leftView
            locationInputField.leftViewMode = .always
            
            locationInputField.attributedPlaceholder = NSAttributedString(string: "Enter city name".uppercased(), attributes: [NSAttributedString.Key.foregroundColor : UIColor.ManiacWeatherTheme.locationTextFieldPlaceHolderColor])
        }
    }
    
    @IBOutlet private weak var historyButton: UIButton! {
        didSet {
            historyButton.backgroundColor = UIColor.ManiacWeatherTheme.historyButtonBackgroundColor
            historyButton.layer.cornerRadius = defaultCornerRadius
            historyButton.layer.masksToBounds = false
            
            historyButton.setTitle("View History".uppercased(), for: .normal)
        }
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        // TODO: show weather
    }
    
    @IBAction func historyButtonClicked(_ sender: Any) {
        // TODO: show history
    }
}
