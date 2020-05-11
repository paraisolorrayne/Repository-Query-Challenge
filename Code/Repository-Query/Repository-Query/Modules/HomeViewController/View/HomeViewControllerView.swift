//  
//  HomeViewControllerView.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 08/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit

class HomeViewControllerView: UIViewController {

    // OUTLETS HERE

    // VARIABLES HERE
    var viewModel = HomeViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
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
        }

    }
    
}


