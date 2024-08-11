//
//  NewsUseCaseTests.swift
//  HackerNews-SUITests
//
//  Created by JurjDev on 10/08/24.
//

import XCTest
@testable import HackerNews_SUI

final class NewsUseCaseTests: XCTestCase {

    var mockDataStore: NewsDataStoreMock!
    var dbRepository: NewsDBRepository!
    var apiRepository: NewsApiRepositoryMock!
    var sut: NewsRepositoryProtocol!

    override func setUp() {
        super.setUp()
        mockDataStore = NewsDataStoreMock()
        dbRepository = NewsDBRepository(persistantStore: mockDataStore)
        apiRepository = NewsApiRepositoryMock()
        sut = NewsUseCases(dbRepository: dbRepository,
                           apiRepository: apiRepository)
    }
    
    override func tearDown() {
        mockDataStore = nil
        dbRepository = nil
        apiRepository = nil
        sut = nil
        super.tearDown()
    }

    func testUseCase_getNews_apiError_shouldReturnExpectedResult() async {
        // Given
        let expectedResult = NetworkError.dataError.localizedDescription
        apiRepository.newsError = .dataError

        // When
        let result = await sut.getNews(forceCache: true)
        await fulfillment(of: [apiRepository.expectation], timeout: 3)

        // Then
        if case let .failure(error) = result {
            XCTAssertEqual(error.localizedDescription, expectedResult)
        } else {
            XCTFail("Api needs to fail")
        }
    }

    func testUseCase_getNews_shouldReturnExpectedResult() async {
        // Given
        let expectedResult = 0
        apiRepository.newsError = nil

        // When
        let results = await sut.getNews(forceCache: true)
        await fulfillment(of: [apiRepository.expectation], timeout: 3)

        // Then
        if case let .success(response) = results {
            XCTAssertEqual(response.count, expectedResult)
            XCTAssertEqual(mockDataStore.addNewsCalled, 1)
        } else {
            XCTFail("Api response shouldnt fail")
        }
    }
}
