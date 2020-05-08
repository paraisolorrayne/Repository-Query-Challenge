//
//  AppCoordinator.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 08/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit

class Coordinator { }

final class AppCoordinator: SearchFlowCoordinatorDelegate {

    fileprivate let navigationController: UINavigationController
    fileprivate var childCoordinators = [Coordinator]()
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        presentSearch()
    }

    fileprivate func presentSearch() {
        let searchFlowCoordinator = SearchFlowCoordinator(navigationController: navigationController)
        searchFlowCoordinator.delegate = self
        searchFlowCoordinator.start()
        childCoordinators.append(searchFlowCoordinator)
    }
}
