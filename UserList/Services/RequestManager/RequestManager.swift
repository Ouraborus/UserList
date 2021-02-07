//
//  RequestManager.swift
//  UserList
//
//  Created by Esteban Cardona Alvarez on 6/02/21.
//

import Foundation

class RequestManager: RequestManagerProtocol {

    private struct Constants {
        static let urlFormat = "https://jsonplaceholder.typicode.com/%@"
        static let usersQuery = "users"
        static let postsQuery = "posts?userId=%d"
    }

    static func getUsers(completion: @escaping UserResponse) {
        let url = String(format: Constants.urlFormat, Constants.usersQuery)

        guard let request = buildURLRequest(with: url) else {
            completion(.failure(.badUrl))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                completion(.failure(.badData))
                return
            }

            completion(.success(data))
        }

        task.resume()
    }

    static func getPostsFromUser(_ id: Int, completion: @escaping UserPostsResponse) {
        let userPostsString = String(format: Constants.postsQuery, id)
        let url = String(format: Constants.urlFormat, userPostsString)

        guard let request = buildURLRequest(with: url) else {
            completion(.failure(.badUrl))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                completion(.failure(.badData))
                return
            }

            completion(.success(data))
        }

        task.resume()
    }

    private static func buildURLRequest(with query: String) -> URLRequest? {
        guard let url = URL(string: query) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = ServiceMethod.get.rawValue

        return request
    }
}
