//
//  UserViewModelTests.swift
//  UserListTests
//
//  Created by Esteban Cardona Alvarez on 7/02/21.
//

import XCTest
import UIKit
@testable import UserList

class UserViewModelTests: XCTestCase {
    let requestManager = RequestManagerMock.self
    let persistenceManager = PersistenceManagerMock.self

    override func setUp() {
        persistenceManager.users.removeAll()
    }

    func testUserViewModelFetchUsersShouldCallGetUsersAndSuccesfullyReturnUsers() {
        // Given
        let viewModel = UserViewModel(requestManager: requestManager, persistenceManager: persistenceManager)

        // When
        viewModel.fetchUsers()

        // Then
        XCTAssertTrue(requestManager.getUsersWasCalled, "func getUsers should be called")
        XCTAssertFalse(viewModel.users?.isEmpty ?? true, "viewModel users should not be empty")
    }

    func testUserViewModelFetchUsersShouldReturnValidUser() {
        // Given
        let expectedUserId = 1
        let expectedUserName = "Leanne Graham"
        let expectedPhone = "1-770-736-8031 x56442"
        let expectedEmail = "Sincere@april.biz"
        let viewModel = UserViewModel(requestManager: requestManager, persistenceManager: persistenceManager)

        // When
        viewModel.fetchUsers()

        // Then
        XCTAssertEqual(viewModel.users?.first?.id, expectedUserId, "Id should be \(expectedUserId)")
        XCTAssertEqual(viewModel.users?.first?.name, expectedUserName, "Name should be \(expectedUserName)")
        XCTAssertEqual(viewModel.users?.first?.phone, expectedPhone, "Phone should be \(expectedPhone)")
        XCTAssertEqual(viewModel.users?.first?.email, expectedEmail, "email should be \(expectedEmail)")
    }

    func testUserViewModelFilterUsersShouldReturnCorrectUser() {
        // Given
        let expectedNumberOfUsers = 1
        let expectedUserId = 1
        let expectedUserName = "Leanne Graham"
        let expectedPhone = "1-770-736-8031 x56442"
        let expectedEmail = "Sincere@april.biz"
        let searchBar = UISearchBar()
        let viewModel = UserViewModel(requestManager: requestManager, persistenceManager: persistenceManager)
        searchBar.delegate = viewModel
        viewModel.fetchUsers()

        // When

        searchBar.delegate?.searchBar?(searchBar, textDidChange: "Leanne Graham")

        // Then
        XCTAssertEqual(viewModel.users?.count, expectedNumberOfUsers)
        XCTAssertEqual(viewModel.users?.first?.id, expectedUserId, "Id should be \(expectedUserId)")
        XCTAssertEqual(viewModel.users?.first?.name, expectedUserName, "Name should be \(expectedUserName)")
        XCTAssertEqual(viewModel.users?.first?.phone, expectedPhone, "Phone should be \(expectedPhone)")
        XCTAssertEqual(viewModel.users?.first?.email, expectedEmail, "email should be \(expectedEmail)")
    }

    func testUserViewModelFilterUsersShouldReturnEmpty() {
        // Given
        let expectedNumberOfUsers = 0
        let searchBar = UISearchBar()
        let viewModel = UserViewModel(requestManager: requestManager, persistenceManager: persistenceManager)
        searchBar.delegate = viewModel
        viewModel.fetchUsers()

        // When

        searchBar.delegate?.searchBar?(searchBar, textDidChange: "!@123")

        // Then
        XCTAssertEqual(viewModel.users?.count, expectedNumberOfUsers)
    }

}
