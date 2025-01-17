//
//  AppDelegate.swift
//  WeatherTracker
//
//  Created by Amjad on 17/01/25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = WeatherViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

