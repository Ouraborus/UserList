//
//  RequestManagerProtocol.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import Foundation
import CoreData

protocol RequestManagerProtocol {
    typealias UserResponse = (Result<Data, ServiceError>) -> Void
    typealias UserPostsResponse = (Result<Data, ServiceError>) -> Void

    static func getUsers(completion: @escaping UserResponse)
    static func getPostsFromUser(_ id: Int, completion: @escaping UserPostsResponse)
}
