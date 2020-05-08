//
//  SearchCoordinator.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit

class SearchCoordinator: Coordinator {
    
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchViewController = SearchViewController()
        searchViewController.searchView.delegate = self
        self.navigationController.viewControllers = [searchViewController]
    }
}

extension SearchCoordinator: SearchViewDelegate {

    // Navigate to next page
    func navigateToNextPage() {
//       let secondCoordinator = SecondCoordinator(navigationController: navigationController)
//       secondCoordinator.delegate = self
//       childCoordinators.append(secondCoordinator)
//       secondCoordinator.start()
    }
}
//
//extension FirstCoordinator: BackToFirstViewControllerDelegate {
//    
//    // Back from third page
//    func navigateBackToFirstPage(newOrderCoordinator: SecondCoordinator) {
//        navigationController.popToRootViewController(animated: true)
//        childCoordinators.removeLast()
//    }
//}
