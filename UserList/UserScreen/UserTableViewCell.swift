//
//  UserTableViewCell.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    var userView: UserView?
    let showPostsButton = UIButton()

    func setupView(model: User) {
        userView = UserView()
        userView?.setupView(name: model.name, phone: model.phone, email: model.email)

        guard let userView = userView else {
            return
        }

        self.addSubview(userView)
        self.addSubview(showPostsButton)

        userView.translatesAutoresizingMaskIntoConstraints = false
        userView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        userView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        userView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        showPostsButton.setTitle("Show Posts", for: .normal)
        showPostsButton.backgroundColor = .purple
        showPostsButton.translatesAutoresizingMaskIntoConstraints = false
        showPostsButton.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 10).isActive = true
        showPostsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        showPostsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        showPostsButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        showPostsButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
