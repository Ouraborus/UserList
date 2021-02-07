//
//  UserTableViewCell.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    private struct Constants {
        static let showPostButtonTitle = "SHOW POSTS"
        static let showPostsButtonTopAnchor: CGFloat = 10
        static let showPostsButtonTrailingAnchor: CGFloat = -20
        static let showPostsButtonBottomAnchor: CGFloat = -20
        static let showPostsButtonHeight: CGFloat = 30
        static let showPostsButtonWidth: CGFloat = 200
        static let phoneIconCode = "phone.circle.fill"
        static let emailIconCode = "envelope.circle.fill"
    }

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
        showPostsButton.translatesAutoresizingMaskIntoConstraints = false

        userView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        userView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        userView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        showPostsButton.setTitle(Constants.showPostButtonTitle, for: .normal)
        showPostsButton.setTitleColor(.purple, for: .normal)
        showPostsButton.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: Constants.showPostsButtonTopAnchor).isActive = true
        showPostsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.showPostsButtonTrailingAnchor).isActive = true
        showPostsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.showPostsButtonBottomAnchor).isActive = true
        showPostsButton.widthAnchor.constraint(equalToConstant: Constants.showPostsButtonWidth).isActive = true
        showPostsButton.heightAnchor.constraint(equalToConstant: Constants.showPostsButtonHeight).isActive = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapShowPostsButton))
        showPostsButton.addGestureRecognizer(tapGesture)
    }

    @objc private func didTapShowPostsButton() {
        delegate?.navigate(to: self.model)
    }
}
