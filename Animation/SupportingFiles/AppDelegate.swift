//
//  AppDelegate.swift
//  Animation
//
//  Created by Aida on 19.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow()
    private var appManager: AppManaging?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if let appWindow = UIApplication.shared.delegate?.window! {
            appManager = AppManager(window: appWindow)
            appManager?.setup()
        }
        return true
    }
}

