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

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var bodyView: UIView!
    // VARIABLES HERE
    var viewModel = SearchViewModel()
    weak var delegate: SearchViewControllerDelegate?
    var tableView: UITableView! = nil
    var safeArea: UILayoutGuide!
    var model: [RepositoryItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repositórios"
        setupTableView()
        setupViewModel()
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
        
        self.viewModel.fetchRepositoryBy(languageName: "swift")
        
        
        self.viewModel.didGetData = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    fileprivate func setStateScreen() {
        
        if viewModel.count == 0 {
            let emptyView = UIView(frame: self.bodyView.bounds)
            let emptyImage = UIImageView(image: UIImage(named: "empty"))
            emptyView.addSubview(emptyImage)
            bodyView.addSubview(emptyView)
        } else {
            setupTableView()
        }
    }
    
    func setupTableView() {
        tableView = UITableView(frame: bodyView.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        safeArea = view.layoutMarginsGuide
        let nib = UINib(nibName: "RepositoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(RepositoryTableViewCell.self)")
        bodyView.addSubview(tableView)
    }
}
