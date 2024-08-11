//
//  NewsDataStoreMock.swift
//  HackerNews-SUITests
//
//  Created by JurjDev on 10/08/24.
//

import Foundation
@testable import HackerNews_SUI

final class NewsDataStoreMock: NewsDataStoreProtocol {

    var addNewsCalled: Int = 0
    var mockNews: [StoryModel] = []

    func getNews() -> [StoryModel] {
        return mockNews
    }
    
    func addNews(news: [StoryModel]) {
        addNewsCalled += 1
    }
}
