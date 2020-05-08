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
    fileprivate let searchViewController: SearchView
    fileprivate let navigationDelegate: NavigationControllerDelegate?
    weak var delegate: SearchFlowCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationDelegate = NavigationControllerDelegate()
        self.navigationController.delegate = navigationDelegate
        self.searchViewController = SearchView()
    }

    func start() {
        searchViewController.delegate = self
        
        guard let topViewController = navigationController.topViewController else {
            return navigationController.setViewControllers([searchViewController], animated: false)
        }
        
        searchViewController.view.frame = topViewController.view.frame
        UIView.transition(from:topViewController.view, to: searchViewController.view, duration: 0.50, options: .transitionCrossDissolve) {[unowned self] (_) in
            self.navigationController.setViewControllers([self.searchViewController], animated: false)
        }
        
    }

    fileprivate func popViewController() {
        navigationController.popViewController(animated: true)
    }
    
    fileprivate func dismissModal() {
        navigationController.dismiss(animated: true, completion: nil)
    }

    fileprivate func presentDetailViewController() {
        let detailsViewController = DetailView()
//        detailsViewController.delegate = self
        navigationController.pushViewController(detailsViewController, animated: true)
        
    }

}

extension SearchFlowCoordinator: SearchViewDelegate {
    func navigateToNextPage() {
        presentDetailViewController()
    }
}
