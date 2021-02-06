//
//  ServiceError.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import Foundation

enum ServiceError: Error {
    case unableToParse
    case badData
    case badUrl
}
