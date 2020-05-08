//  
//  SearchView.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit

protocol SearchViewDelegate: class {
    func navigateToNextPage()
}

class SearchView: UIViewController {

    // OUTLETS HERE
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var bodyView: UIView!
    // VARIABLES HERE
    var viewModel = SearchViewModel()
    weak var delegate: SearchViewDelegate?
    let tableView = UITableView()
    var safeArea: UILayoutGuide!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repositórios"
        setupViewModel()
        setStateScreen()
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
            // update UI after get data
            self.tableView.reloadData()
        }
        self.viewModel.fetchRepositoryBy(languageName: "swift")

    }

    fileprivate func setStateScreen() {
        
        if viewModel.count > 0 {
            let emptyView = UIView(frame: self.bodyView.frame)
            let emptyImage = UIImageView(image: UIImage(named: "empty"))
            emptyView.addSubview(emptyImage)
            bodyView.addSubview(emptyView)
        } else {
            setupTableView()
        }
    }

    func setupTableView() {
        safeArea = view.layoutMarginsGuide
      view.addSubview(tableView)
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    @IBAction func goToSecondPageAction(_ sender: Any) {
        self.delegate?.navigateToNextPage()
    }
    
}


