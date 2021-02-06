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
    private let requestManager: RequestManagerProtocol.Type
    private let persistenceManager: PersistenceManagerProtocol.Type
    weak var delegate: ViewControllerDelegate?
    private(set) var users: [User]?

    init(requestManager: RequestManagerProtocol.Type, persistenceManager: PersistenceManagerProtocol.Type) {
        self.requestManager = requestManager
        self.persistenceManager = persistenceManager
    }

    func fetchUsers() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let context = appDelegate.persistentContainer.viewContext
        let users = persistenceManager.retrieve(context: context, filter: nil)

        guard users.isEmpty else {
            self.users = users
            delegate?.reloadData()
            return
        }

        requestManager.getUsers() { [weak self] result in
            switch result {
            case .success(let data):
                self?.persistenceManager.save(data: data, context: context)
                self?.users = self?.persistenceManager.retrieve(context: context, filter: nil)
                self?.delegate?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
