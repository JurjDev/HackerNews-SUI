//
//  NewsDBRepositoryTests.swift
//  HackerNews-SUITests
//
//  Created by JurjDev on 10/08/24.
//

import XCTest
@testable import HackerNews_SUI

final class NewsDBRepositoryTests: XCTestCase {
    
    var mockDataStore: NewsDataStoreMock!
    var sut: NewsDBRepository!

    override func setUp() {
        super.setUp()
        mockDataStore = NewsDataStoreMock()
        sut = NewsDBRepository(persistantStore: mockDataStore)
    }
    override func tearDown() {
        mockDataStore = nil
        sut = nil
        super.tearDown()
    }

    func testsNewsDBRepository_getNews_shouldReturnExpectedResult() {
        // Given
        let expectedResult = 1
        mockDataStore.mockNews = [
            .mockModel
        ]

        // When
        let result = sut.getNews()

        // Then
        XCTAssertEqual(result.count, expectedResult)
    }

    func testsNewsDBRepository_AddNews_shouldReturnExpectedResult() {
        // Given
        let expectedResult = 1

        // When
        sut.addNews(news: [])
        
        // Then
        XCTAssertEqual(mockDataStore.addNewsCalled, expectedResult)
    }
}

extension StoryModel {
    static var mockModel: StoryModel {
        .init(id: "",
              title: "",
              author: "",
              createdAt: .now,
              stringURL: "")
    }
}
