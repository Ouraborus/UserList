//
//  UserTableViewCell.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    var model: User?
    var userView: UserView?
    let showPostsButton = UIButton()
    weak var delegate: ViewControllerDelegate?

    func setupView(model: User) {
        self.model = model
        userView = UserView()
        userView?.setupView(name: model.name, phone: model.phone, email: model.email)

        guard let userView = userView else {
            return
        }

        self.contentView.addSubview(userView)
        self.contentView.addSubview(showPostsButton)

        userView.translatesAutoresizingMaskIntoConstraints = false
        userView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        userView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        userView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        showPostsButton.setTitle("Show Posts", for: .normal)
        showPostsButton.backgroundColor = .purple
        showPostsButton.translatesAutoresizingMaskIntoConstraints = false
        showPostsButton.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 10).isActive = true
        showPostsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        showPostsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        showPostsButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        showPostsButton.heightAnchor.constraint(equalToConstant: 25).isActive = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapShowPostsButton))
        showPostsButton.addGestureRecognizer(tapGesture)
    }

    @objc private func didTapShowPostsButton() {
        delegate?.navigate(to: self.model)
    }
}
