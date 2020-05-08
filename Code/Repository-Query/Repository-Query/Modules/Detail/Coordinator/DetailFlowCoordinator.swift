//
//  DetailFlowCoordinator.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit

protocol DetailFlowCoordinatorDelegate:class { }

class DetailFlowCoordinator: Coordinator  {
    
    fileprivate let navigationController: UINavigationController
    fileprivate let detailViewController: DetailView
    fileprivate let navigationDelegate: NavigationControllerDelegate?
    weak var delegate: SearchFlowCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationDelegate = NavigationControllerDelegate()
        self.navigationController.delegate = navigationDelegate
        self.detailViewController = DetailView()
    }
    
    func start() {
        detailViewController.delegate = self
        
        guard let topViewController = navigationController.topViewController else {
            return navigationController.setViewControllers([detailViewController], animated: false)
        }
        
        detailViewController.view.frame = topViewController.view.frame
        UIView.transition(from:topViewController.view, to: detailViewController.view, duration: 0.50, options: .transitionCrossDissolve) {[unowned self] (_) in
            self.navigationController.setViewControllers([self.detailViewController], animated: false)
        }
        
    }
    
    fileprivate func popViewController() {
        navigationController.popViewController(animated: true)
    }
    
    fileprivate func dismissModal() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
}

extension DetailFlowCoordinator: DetailViewDelegate {
    func navigateToPreviousPage() {
        popViewController()
    }
}

