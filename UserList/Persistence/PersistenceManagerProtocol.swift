//
//  PersistenceManagerProtocol.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import Foundation
import CoreData

protocol PersistenceManagerProtocol {
    static func save(data: Data, context: NSManagedObjectContext)
    static func retrieve(context: NSManagedObjectContext, filter: String?) -> [User]
}
