//
//  AppCoordinator.swift
//  BlogReader
//
//  Created by Admin on 16.07.2021.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {

    // MARK: - Private properties
    private var window: UIWindow?
    private var navigationController: UINavigationController?
        
    // MARK: - Init
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = TabBarController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
