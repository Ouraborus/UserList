//
//  UserPostsTableViewCell.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 7/02/21.
//

import UIKit

class UserPostsTableViewCell: UITableViewCell {
    var title = UILabel()
    var body = UILabel()

    func setupView(model: UserPost) {
        title.text = model.title
        body.text = model.body

        contentView.addSubview(title)
        contentView.addSubview(body)

        title.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false

        title.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        body.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        body.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        body.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        body.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

}
