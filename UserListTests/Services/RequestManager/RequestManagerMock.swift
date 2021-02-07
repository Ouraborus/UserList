//
//  RequestManagerMock.swift
//  UserListTests
//
//  Created by Esteban Cardona Alvarez on 7/02/21.
//

import Foundation
@testable import UserList

class RequestManagerMock: RequestManagerProtocol {
    static var getUsersWasCalled: Bool = false
    static var getPostsFromUserWasCalled: Bool = false
    static var error: ServiceError?
    

    static func getUsers(completion: @escaping UserResponse) {
        getUsersWasCalled = true

        guard let result = loadJson(filename: "UsersDataMock") else {
            return
        }

        guard let error = error else {
            completion(.success(result))
            return
        }

        completion(.failure(error))
    }

    static func getPostsFromUser(_ id: Int, completion: @escaping UserPostsResponse) {
        getPostsFromUserWasCalled = true

        guard let result = loadJson(filename: "UserPostsMock") else {
            return
        }

        guard let error = error else {
            completion(.success(result))
            return
        }

        completion(.failure(error))
    }

    private static func loadJson(filename fileName: String) -> Data? {
        guard let url = Bundle(for: self).path(forResource: fileName, ofType: "json") else {
            return nil
        }
        let data = try? Data(contentsOf: URL(fileURLWithPath: url))
        return data
    }
}
