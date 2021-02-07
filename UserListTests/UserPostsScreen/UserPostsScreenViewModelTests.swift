//
//  UserPostsScreenViewModelTests.swift
//  UserListTests
//
//  Created by Esteban Cardona Alvarez on 7/02/21.
//

import XCTest
@testable import UserList

class UserPostsScreenViewModelTests: XCTestCase {
    let requestManager = RequestManagerMock.self

    func testUserPostsScreenViewModelShouldCallGetPostsFromUserAndSuccesfullyReturnPosts() {
        // Given
        let expectedNumberOfPosts = 10
        let userViewModel = UserViewModel(requestManager: requestManager, persistenceManager: PersistenceManagerMock.self)
        userViewModel.fetchUsers()

        guard let user = userViewModel.users?.first else {
            XCTFail()
            return
        }

        let viewModel = UserPostsViewModel(user: user, requestManager: requestManager)

        // When
        viewModel.fetchPosts()

        // Then
        XCTAssertFalse(viewModel.posts?.isEmpty ?? true, "user posts should not be empty")
        XCTAssertEqual(viewModel.posts?.count, expectedNumberOfPosts, "user should have \(expectedNumberOfPosts) posts")
    }

    func testUserPostsScreenViewModelShouldCallGetPostsFromUserAndReturnCorrectPost() {
        // Given
        let expectedPost = UserPost(id: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
        let userViewModel = UserViewModel(requestManager: requestManager, persistenceManager: PersistenceManagerMock.self)
        userViewModel.fetchUsers()

        guard let user = userViewModel.users?.first else {
            XCTFail()
            return
        }

        let viewModel = UserPostsViewModel(user: user, requestManager: requestManager)

        // When
        viewModel.fetchPosts()

        // Then
        guard let post = viewModel.posts?.first else {
            XCTFail()
            return
        }

        XCTAssertEqual(post.id, expectedPost.id, "user post id should match expected post")
        XCTAssertEqual(post.title, expectedPost.title, "user post title should match expected post")
        XCTAssertEqual(post.body, expectedPost.body, "user post body should match expected post")
    }
}
