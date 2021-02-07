//
//  PersistenceManagerMock.swift
//  UserListTests
//
//  Created by Esteban Cardona Alvarez on 7/02/21.
//

import Foundation
import CoreData
@testable import UserList

class PersistenceManagerMock: PersistenceManagerProtocol {
    static var users: [User] = []

    static func save(data: Data, context: NSManagedObjectContext) {
        guard let codignUserInfoKey = CodingUserInfoKey.context else {
            return
        }

        let decoder = JSONDecoder()
        decoder.userInfo[codignUserInfoKey] = context

        guard let users  = try? decoder.decode([User].self, from: data) else {
            return
        }

        Self.users = users
    }

    static func retrieve(context: NSManagedObjectContext, filter: String?) -> [User] {
        guard let filter = filter else {
            return users
        }

        return users.filter { $0.name == filter }
    }
}
