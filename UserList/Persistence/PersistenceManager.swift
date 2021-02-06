//
//  PersistenceManager.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import Foundation
import CoreData

final class PersistenceManager: PersistenceManagerProtocol {
    private struct Constants {
        static let entityName = "User"
    }
    
    static func save(data: Data, context: NSManagedObjectContext) {
        guard let codingUserInfoKey = CodingUserInfoKey.context else {
            return
        }


        let decoder = JSONDecoder()
        decoder.userInfo[codingUserInfoKey] = context

        do {
            _ = try decoder.decode([User].self, from: data)
            try context.save()
        } catch {
            // Throw Error
        }
    }


    static func retrieve(context: NSManagedObjectContext, filter: String?) -> [User] {
        var cachedUsers: [User] = []

        let request = NSFetchRequest<NSManagedObject>(entityName: Constants.entityName)
        request.predicate = (filter?.isEmpty ?? true) ? nil : NSPredicate(format: "name CONTAINS %@", filter ?? "")

        do {
            cachedUsers = try context.fetch(request) as? [User] ?? []
        } catch {
            // Throw Error
        }

        return cachedUsers
    }


    static func clearData(context: NSManagedObjectContext) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.entityName)

        do {
            let results = try context.fetch(request)

            for object in results {
                guard let object = object as? NSManagedObject else {
                    continue
                }

                context.delete(object)
            }
        } catch let error {
            // Throw Error
        }
    }
}
