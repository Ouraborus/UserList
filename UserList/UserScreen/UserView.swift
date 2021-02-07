//
//  UserView.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import UIKit

class UserView: UIView {

    private struct Constants {
        static let nameLabelTopAnchor: CGFloat = 10
        static let nameLabelLeadingAnchor: CGFloat = 10
        static let nameLabelTrailingAnchor: CGFloat = -10
        static let phoneLabelTopAnchor: CGFloat = 20
        static let phoneLabelLeadingAnchor: CGFloat = 15
        static let phoneLabelTrailingAnchor: CGFloat = -20
        static let emailLabelTopAnchor: CGFloat = 20
        static let emailLabelLeadingAnchor: CGFloat = 15
        static let emailLabelTrailingAnchor: CGFloat = -20
        static let emailLabelBottomAnchor: CGFloat = -20
        static let phoneIconTopAnchor: CGFloat = 20
        static let phoneIconLeadingAnchor: CGFloat = 20
        static let emailIconTopAnchor: CGFloat = 20
        static let emailIconLeadingAnchor: CGFloat = 20
        static let phoneIconCode = "phone.circle.fill"
        static let emailIconCode = "envelope.circle.fill"
        static let iconSize: CGFloat = 30
    }

    private let nameLabel = UILabel()
    private let phoneLabel = UILabel()
    private let emailLabel = UILabel()

    func setupView(name: String, phone: String, email: String) {
        nameLabel.text = name
        phoneLabel.text = phone
        emailLabel.text = email

        let phoneIcon = UIImageView(image: UIImage(systemName: Constants.phoneIconCode))
        let emailIcon = UIImageView(image: UIImage(systemName: Constants.emailIconCode))
        phoneIcon.tintColor = .purple
        emailIcon.tintColor = .purple

        addSubview(nameLabel)
        addSubview(phoneLabel)
        addSubview(emailLabel)
        addSubview(phoneIcon)
        addSubview(emailIcon)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneIcon.translatesAutoresizingMaskIntoConstraints = false
        emailIcon.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.nameLabelTopAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.nameLabelLeadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.nameLabelTrailingAnchor).isActive = true

        phoneIcon.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.phoneIconTopAnchor).isActive = true
        phoneIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.phoneIconLeadingAnchor).isActive = true
        phoneIcon.widthAnchor.constraint(equalToConstant: Constants.iconSize).isActive = true
        phoneIcon.heightAnchor.constraint(equalToConstant: Constants.iconSize).isActive = true

        phoneLabel.centerYAnchor.constraint(equalTo: phoneIcon.centerYAnchor).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: phoneIcon.trailingAnchor, constant: Constants.phoneLabelLeadingAnchor).isActive = true
        phoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.nameLabelTrailingAnchor).isActive = true

        emailIcon.topAnchor.constraint(equalTo: phoneIcon.bottomAnchor, constant: Constants.emailIconTopAnchor).isActive = true
        emailIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.emailIconLeadingAnchor).isActive = true
        emailIcon.widthAnchor.constraint(equalToConstant: Constants.iconSize).isActive = true
        emailIcon.heightAnchor.constraint(equalToConstant: Constants.iconSize).isActive = true

        emailLabel.centerYAnchor.constraint(equalTo: emailIcon.centerYAnchor).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: emailIcon.trailingAnchor, constant: Constants.emailIconLeadingAnchor).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.emailLabelTrailingAnchor).isActive = true
        emailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.emailLabelBottomAnchor).isActive = true
    }
}
