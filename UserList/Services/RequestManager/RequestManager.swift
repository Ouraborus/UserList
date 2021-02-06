//
//  RequestManager.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import Foundation

class RequestManager: RequestManagerProtocol {

    private struct Constants {
        static let url = "https://jsonplaceholder.typicode.com/users"
    }

    static func getUsers(completion: @escaping UserResponse) {
        guard let url = URL(string: Constants.url) else {
            completion(.failure(.badUrl))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = ServiceMethod.get.rawValue

        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                completion(.failure(.badData))
                return
            }

            guard let users = try? JSONDecoder().decode([User].self, from: data) else {
                completion(.failure(.unableToParse))
                return
            }

            completion(.success(users))
        }

        task.resume()
    }
}
