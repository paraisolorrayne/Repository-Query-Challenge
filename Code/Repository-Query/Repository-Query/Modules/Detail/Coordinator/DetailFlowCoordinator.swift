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
    weak var delegate: SearchFlowCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.detailViewController = DetailView(fullName: "")!
    }
    
    func start() {
        detailViewController.modalPresentationStyle = .fullScreen
        detailViewController.delegate = self
        navigationController.viewControllers.append(detailViewController)
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

