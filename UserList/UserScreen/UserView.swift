//
//  UserView.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import UIKit

class UserView: UIView {

    private let nameLabel = UILabel()
    private let phoneLabel = UILabel()
    private let emailLabel = UILabel()

    func setupView(name: String, phone: String, email: String) {
        nameLabel.text = name
        phoneLabel.text = phone
        emailLabel.text = email

        addSubview(nameLabel)
        addSubview(phoneLabel)
        addSubview(emailLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        phoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        emailLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        emailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }

}
