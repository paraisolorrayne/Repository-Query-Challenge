//  
//  DetailView.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit
import MarkdownView
import SafariServices

protocol DetailViewDelegate: class {
    func navigateToPreviousPage()
}

class DetailView: UIViewController {

    // OUTLETS HERE
    // VARIABLES HERE
    var viewModel = DetailViewModel()
    weak var delegate: DetailViewDelegate?
    

    let fullName: String
    
    init?(fullName: String) {
        self.fullName = fullName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

        self.viewModel.fetchReadme(with: fullName)
        self.viewModel.didGetData = {
            DispatchQueue.main.async {
                self.renderReadme(base64String: self.viewModel.base64String)
            }
        }
        

    }

    fileprivate func renderReadme(base64String: String) {
        let decodedData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters)!
        let decodedString = String(data: decodedData, encoding: .utf8)!
        let markDownView = MarkdownView()
        markDownView.frame = view.frame
        view.addSubview(markDownView)
        markDownView.load(markdown: decodedString)
        // called when user touch link
        markDownView.onTouchLink = { [weak self] request in
            guard let url = request.url else { return false }
            
            if url.scheme == "file" {
                return false
            } else if url.scheme == "https" {
                let safari = SFSafariViewController(url: url)
                self?.navigationController?.pushViewController(safari, animated: true)
                return false
            } else {
                return false
            }
        }
    }
}


