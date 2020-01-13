//
//  SceneDelegate.swift
//  ManiacWeather
//
//  Created by Peter Lizak on 09/01/2020.
//  Copyright © 2020 Peter Lizak. All rights reserved.
//
import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window : UIWindow?
    func scene(_ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            if let windowScene = scene as? UIWindowScene {
                self.window = UIWindow(windowScene: windowScene)
                self.window?.rootViewController = UINavigationController(rootViewController: DashboardViewController())
                self.window?.makeKeyAndVisible()                
            }
    }
}
