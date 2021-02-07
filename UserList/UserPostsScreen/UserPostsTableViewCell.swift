//
//  UserPostsTableViewCell.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 7/02/21.
//

import UIKit

class UserPostsTableViewCell: UITableViewCell {

    private struct Constants {
        static let titleTopAnchor: CGFloat = 10
        static let titleLeadingAnchor: CGFloat = 15
        static let titleTrailingAnchor: CGFloat = -15
        static let bodyTopAnchor: CGFloat = 10
        static let bodyLeadingAnchor: CGFloat = 20
        static let bodyTrailingAnchor: CGFloat = -20
        static let bodyBottomAnchor: CGFloat = -10
        static let titleFont: UIFont? = UIFont(name: "Futura", size: 20)
        static let bodyFont: UIFont? = UIFont(name: "Futura", size: 16)
    }

    var title = UILabel()
    var body = UILabel()

    func setupView(model: UserPost) {
        title.text = model.title.uppercased()
        body.text = model.body

        contentView.addSubview(title)
        contentView.addSubview(body)

        title.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false

        title.numberOfLines = 0
        body.numberOfLines = 0

        title.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: Constants.titleTopAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Constants.titleLeadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.titleTrailingAnchor).isActive = true
        title.font = Constants.titleFont

        body.topAnchor.constraint(equalTo: title.bottomAnchor, constant: Constants.bodyTopAnchor).isActive = true
        body.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.bodyLeadingAnchor).isActive = true
        body.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.bodyTrailingAnchor).isActive = true
        body.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.bodyBottomAnchor).isActive = true
        body.font = Constants.bodyFont
        body.textAlignment = .justified
    }

}
