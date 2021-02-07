//
//  ViewController.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import UIKit

class UsersViewController: UIViewController {

    private struct Constants {
        static let tableViewTopSpace: CGFloat = 20
        static let searchBarLeadingAnchor: CGFloat = 20
    }

    private var searchBar = UISearchBar()
    private var tableView = UITableView()
    private var emptyView = UserEmptyView()
    private var activityIndicator = UIActivityIndicatorView()

    let viewModel = UserViewModel(requestManager: RequestManager.self, persistenceManager: PersistenceManager.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        searchBar.delegate = viewModel
        viewModel.fetchUsers()
        view.backgroundColor = .white
        setupSearchBar()
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func setupSearchBar() {
        view.addSubview(searchBar)

        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: Constants.tableViewTopSpace).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let user = viewModel.users?[indexPath.row] else {
            return UITableViewCell()
        }

        let cell = UserTableViewCell()
        cell.setupView(model: user)
        cell.delegate = self
        return cell
    }
}

extension UsersViewController: ViewControllerDelegate {
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    func navigate(to user: User?) {
        guard let user = user else {
            return
        }

        let viewModel = UserPostsViewModel(user: user, requestManager: RequestManager.self)
        let viewController = UserPostsViewController(viewModel: viewModel)

        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setEmptyListVisibility(_ isVisible: Bool) {
        guard tableView.isHidden != isVisible else {
            return
        }
        
        if isVisible {
            emptyView = UserEmptyView()
            view.addSubview(emptyView)
            emptyView.setupView()
            emptyView.translatesAutoresizingMaskIntoConstraints = false
            
            emptyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            emptyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            
        } else {
            emptyView.removeFromSuperview()
        }
        
        tableView.isHidden = isVisible
    }

    func starLoader() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }

            self.activityIndicator.style = .large
            self.activityIndicator.color = .purple

            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false

            self.activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            self.activityIndicator.startAnimating()
        }
    }

    func stopLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.removeFromSuperview()
        }
    }
}
