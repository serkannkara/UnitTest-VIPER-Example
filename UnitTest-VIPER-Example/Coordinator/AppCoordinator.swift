//
//  AppCoordinator.swift
//  UnitTest-VIPER-Example
//
//  Created by Serkan Kara on 24.01.2024.
//

import UIKit

protocol AppCoordinatoring {
    init(navigation: UINavigationController)
    func start()
}

class AppCoordinator: NSObject, AppCoordinatoring {
    
    var navigationController: UINavigationController
    
    required init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        let builder: NewsListBuilderInterface = NewsListBuilder()
        let vc = builder.build()
        self.navigationController.viewControllers = [vc]
    }
}
