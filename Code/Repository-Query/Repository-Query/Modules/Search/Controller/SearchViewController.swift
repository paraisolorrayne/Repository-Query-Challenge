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
    
    override func loadView() {
        self.view = searchView.view
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This View is not intended to be instantiated via Storyboard")
    }
}
