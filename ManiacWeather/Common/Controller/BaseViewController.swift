//
//  BaseViewController.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 09/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    func showError(errorString: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error",
                                          message: errorString,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
