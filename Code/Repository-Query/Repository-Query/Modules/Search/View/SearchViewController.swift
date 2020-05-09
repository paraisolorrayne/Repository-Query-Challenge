//
//  SearchViewController.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 08/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit

protocol SearchViewControllerDelegate: class {
    func navigateToNextPage(fullName: String)
}

class SearchViewController: UIViewController, UISearchControllerDelegate {


    @IBOutlet weak var tableView: UITableView!
    // VARIABLES HERE
    var viewModel = SearchViewModel()
    weak var delegate: SearchViewControllerDelegate?
    var safeArea: UILayoutGuide!
    var model: [RepositoryItem]!
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repositórios"
        setupTableView()
        setupViewModel()
        setupSearchBar()
    }
    
    fileprivate func setupViewModel() {
        
        self.viewModel.showAlertClosure = {
            let alert = self.viewModel.alertMessage ?? ""
            print(alert)
        }
        
        self.viewModel.updateLoadingStatus = {
            if self.viewModel.isLoading {
                print("LOADING...")
            } else {
                print("DATA READY")
            }
        }
        
        self.viewModel.internetConnectionStatus = {
            print("Internet disconnected")
            // show UI Internet is disconnected
        }
        
        self.viewModel.serverErrorStatus = {
            print("Server Error / Unknown Error")
            // show UI Server is Error
        }
        
        
        
        
        self.viewModel.didGetData = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(hex: "#D2D3D5")
        safeArea = view.layoutMarginsGuide
        let nib = UINib(nibName: "RepositoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(RepositoryTableViewCell.self)")
        let nibEmpty = UINib(nibName: "EmptyTableViewCell", bundle: nil)
        tableView.register(nibEmpty, forCellReuseIdentifier: "\(EmptyTableViewCell.self)")
    }

    func setupSearchBar() {
        resultSearchController.delegate = self
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            self.viewModel.fetchRepositoryBy(languageName: text)
            self.tableView.reloadData()
        }
    }
}


