//
//  UserPostsViewController.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import UIKit

class UserPostsViewController: UIViewController {
    let user: User

    init(_ user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

}
