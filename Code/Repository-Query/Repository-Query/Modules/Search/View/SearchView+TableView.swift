//
//  SearchView+TableView.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 07/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(RepositoryTableViewCell.self)") as! RepositoryTableViewCell
        let repositoryItem = self.viewModel.items[indexPath.row]
        cell.configure(with: repositoryItem)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.navigateToNextPage()
    }
}
