//
//  SearchFlowCoordinator.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 08/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit

protocol SearchFlowCoordinatorDelegate:class { }

class SearchFlowCoordinator: Coordinator  {

    fileprivate let navigationController: UINavigationController
    fileprivate let searchViewController: SearchViewController
    weak var delegate: SearchFlowCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.searchViewController = SearchViewController()
    }

    func start() {
        searchViewController.modalPresentationStyle = .fullScreen
        searchViewController.delegate = self
        navigationController.viewControllers.append(searchViewController)
    }

    fileprivate func popViewController() {
        navigationController.popViewController(animated: true)
    }
    
    fileprivate func dismissModal() {
        navigationController.dismiss(animated: true, completion: nil)
    }

    fileprivate func presentDetailViewController(fullName: String) {
        let detailsViewController = DetailView(fullName: fullName)
        navigationController.pushViewController(detailsViewController!, animated: true)
        
    }

}

extension SearchFlowCoordinator: SearchViewControllerDelegate {
    
    func navigateToNextPage(fullName: String) {
        presentDetailViewController(fullName: fullName)
    }
}
