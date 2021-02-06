//
//  User.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import Foundation
import CoreData

class User: NSManagedObject, Codable {
    @NSManaged var name: String
    @NSManaged var phone: String
    @NSManaged var email: String

    enum CodingKeys: String, CodingKey {
        case name
        case phone
        case email
    }

    required convenience init(from decoder: Decoder) throws {
        guard let codingUserInfoKey = CodingUserInfoKey.context,
              let context = decoder.userInfo[codingUserInfoKey] as? NSManagedObjectContext else {
            fatalError()
        }

        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: context) else {
            fatalError()
        }

        self.init(entity: entity, insertInto: context)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        phone = try values.decode(String.self, forKey: .phone)
        email = try values.decode(String.self, forKey: .email)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(phone, forKey: .phone)
        try container.encode(email, forKey: .email)
    }
}

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}
