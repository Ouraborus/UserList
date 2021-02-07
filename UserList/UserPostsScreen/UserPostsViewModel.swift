//
//  UserPostsViewModel.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 7/02/21.
//

import Foundation
import UIKit

protocol UserPostsViewControllerDelegate where Self: UIViewController {
    func reloadData()
}

class UserPostsViewModel {
    private let requestManager: RequestManagerProtocol.Type
    let user: User
    private(set) var posts: [UserPost]?
    weak var delegate: UserPostsViewControllerDelegate?

    init(user: User, requestManager: RequestManagerProtocol.Type) {
        self.requestManager = requestManager
        self.user = user
    }

    func fetchPosts() {
        requestManager.getPostsFromUser(user.id) { [weak self] result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                let posts  = try? decoder.decode([UserPost].self, from: data)
                self?.posts = posts
                self?.delegate?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
