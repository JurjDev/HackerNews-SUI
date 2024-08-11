//
//  NewsApiRepositoryMock.swift
//  HackerNews-SUITests
//
//  Created by JurjDev on 10/08/24.
//

import XCTest
@testable import HackerNews_SUI

final class NewsApiRepositoryMock: NewsApiRepositoryProtocol {

    var newsError: NetworkError? = nil
    var expectation = XCTestExpectation(description: "NewsApiRepositoryMock")

    func fetchNews() async -> Result<[NewsEntryResponse], NetworkError> {
        
        defer {
            expectation.fulfill() }

        if let newsError {
            return .failure(newsError)
        } else {
            let mocks = [
                NewsEntryResponse.mock0,
                NewsEntryResponse.mock1
            ]
            return .success(mocks)
            
        }
    }
}

extension NewsEntryResponse {
    static var mock0: NewsEntryResponse {
        .init(id: "0",
              storyTitle: "StoryTitle",
              title: nil,
              createdAt: .now,
              author: "Author",
              storyURL: "www.google.com",
              url: nil)
    }

    static var mock1: NewsEntryResponse {
        .init(id: "1",
              storyTitle: nil,
              title: "Title",
              createdAt: .now,
              author: "Author",
              storyURL: nil,
              url: "www.apple.com")
    }
}
