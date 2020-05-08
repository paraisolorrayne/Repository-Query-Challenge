//
//  SearchViewController.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    let searchView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
    }

    override func loadView() {
        self.view = searchView.view
    }

}
