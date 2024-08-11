//
//  APIEndpointTests.swift
//  HackerNews-SUITests
//
//  Created by JurjDev on 10/08/24.
//

import XCTest
@testable import HackerNews_SUI

final class APIEndpointTests: XCTestCase {

    func testApiEndpoint_shouldReturnExpectedResult() {
        // Given
        let expectedResult = "https://hn.algolia.com/api/v1/search_by_date?query=mobile"
        // When
        let sut = APIEndpoint.hackerNews
        // Then
        XCTAssertEqual(sut.urlString, expectedResult)
    }

}
