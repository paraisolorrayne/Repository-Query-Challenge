//
//  RepositoryTableViewCell.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 07/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit
import QuartzCore

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryDescriptionLabel: UILabel!
    @IBOutlet weak var amountStarsLabel: UILabel!
    @IBOutlet weak var forkNumberLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    

    override func prepareForReuse() {
        super.prepareForReuse()
        setupCellStyle()
    }

    func setupCellStyle() {
        authorNameLabel.layer.backgroundColor  = UIColor.red.cgColor
        authorNameLabel.layer.cornerRadius = 5
        authorNameLabel.layer.borderColor = UIColor.darkGray.cgColor
        authorNameLabel.layer.borderWidth = 3.0
        authorNameLabel.layer.masksToBounds = true
    }

    func configure(with model: RepositoryItem) {
        authorImageView.downloaded(from:model.owner?.avatarUrl ?? "")
        repositoryNameLabel.text = model.name ?? ""
        repositoryDescriptionLabel.text = model.descriptionField ?? ""
        amountStarsLabel.text = "\(model.stargazersCount ?? 0)"
        forkNumberLabel.text = "\(model.forksCount ?? 0)"
        authorNameLabel.text = model.owner?.login ?? ""
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
