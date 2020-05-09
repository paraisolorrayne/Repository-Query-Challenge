//
//  SearchView+TableView.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 07/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit
extension UITableView {
    func setEmptyView() {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        self.backgroundView = emptyView
        self.separatorStyle = .none
        let cell = self.dequeueReusableCell(withIdentifier: "\(EmptyTableViewCell.self)") as! EmptyTableViewCell
        cell.backgroundColor = UIColor(hex: "#D2D3D5")
        cell.frame = self.bounds
        emptyView.addSubview(cell)
    }
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.items.count == 0 {
            self.tableView.setEmptyView()
        } else {
            self.tableView.restore()
        }
        return self.viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(RepositoryTableViewCell.self)") as! RepositoryTableViewCell
        let repositoryItem = self.viewModel.items[indexPath.row]
        cell.configure(with: repositoryItem)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let full_name = self.viewModel.items[indexPath.row].fullName ?? ""
        tableView.tableHeaderView = nil
        self.delegate?.navigateToNextPage(fullName: full_name)
        
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
