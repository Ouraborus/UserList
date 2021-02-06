//
//  RequestManagerProtocol.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import Foundation

protocol RequestManagerProtocol {
    typealias UserResponse = (Result<[User], ServiceError>) -> Void
    typealias UserPostsResponse = (Result<[User], ServiceError>) -> Void

    static func getUsers(completion: @escaping UserResponse)
}
