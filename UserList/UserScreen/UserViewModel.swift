//
//  UserViewModel.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import Foundation
import UIKit

protocol ViewControllerDelegate where Self: UIViewController {
    func reloadData()
}

class UserViewModel {

    let requestManager: RequestManagerProtocol.Type
    weak var delegate: ViewControllerDelegate?
    var users: [User]?

    init(requestManager: RequestManagerProtocol.Type) {
        self.requestManager = requestManager
    }

    func fetchUsers() {
        requestManager.getUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                self?.delegate?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
