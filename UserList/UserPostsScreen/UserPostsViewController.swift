//
//  UserPostsViewController.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import Foundation
import UIKit

class UserPostsViewController: UIViewController {
    private let userView = UserView()
    private let userPostTableView = UITableView()
    let viewModel: UserPostsViewModel

    init(viewModel: UserPostsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userPostTableView.dataSource = self
        viewModel.delegate = self
        viewModel.fetchPosts()
        setup()
    }

    private func setup() {
        userView.setupView(name: viewModel.user.name, phone: viewModel.user.phone, email: viewModel.user.email)

        view.addSubview(userView)
        view.addSubview(userPostTableView)
        view.backgroundColor = .white

        userView.translatesAutoresizingMaskIntoConstraints = false
        userPostTableView.translatesAutoresizingMaskIntoConstraints = false

        userView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        userView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        userView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        userPostTableView.topAnchor.constraint(equalTo: userView.bottomAnchor).isActive = true
        userPostTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        userPostTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        userPostTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}

extension UserPostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let post = viewModel.posts?[indexPath.row] else {
            return UITableViewCell()
        }

        let cell = UserPostsTableViewCell()
        cell.setupView(model: post)
        return cell
    }
}

extension UserPostsViewController: UserPostsViewControllerDelegate {
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.userPostTableView.reloadData()
        }
    }
}
