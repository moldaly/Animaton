//
//  AppManager.swift
//  Animation
//
//  Created by Aida on 09.11.2022.
//

import UIKit

protocol AppManaging {
    func setup()
}

final class AppManager: AppManaging {
    private var coordinator: SplashScreenCoordinator?
    private var window: UIWindow
    required init(window: UIWindow) {
        self.window = window
    }
    
    func setup() {
        presentInitialScreen()
    }
    
    private func presentInitialScreen() {
        coordinator = SplashScreenCoordinatorManager(window: window)
        coordinator?.start()
    }
}


