//
//  SplashScreenCoordinatorManager.swift
//  Animation
//
//  Created by Aida on 09.11.2022.
//

import UIKit

protocol Coordinator {
    /// returns UIViewController of module to be the first module of Coordinator, Coordinator manager becomes delegate of module output
    func makeFirstViewController() -> UIViewController
}

protocol SplashScreenCoordinator: AnyObject, Coordinator {
    func start()
}

final class SplashScreenCoordinatorManager: SplashScreenCoordinator {
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func makeFirstViewController() -> UIViewController {
        let viewController = PreInitialViewController()
        return viewController
    }
    
    func start() {
        let viewController = makeFirstViewController()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}

