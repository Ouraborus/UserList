//
//  UserEmptyView.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import UIKit

class UserEmptyView: UIView {

    let emptyLabel = UILabel()

    func setupView() {
        emptyLabel.text = "List is Empty"
        emptyLabel.textColor = .black

        addSubview(emptyLabel)
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false

        emptyLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emptyLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
