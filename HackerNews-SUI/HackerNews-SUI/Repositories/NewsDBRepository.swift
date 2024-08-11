//
//  NewsDBRepository.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation

protocol NewsDBRepositoryProtocol {
    func getNews() -> [StoryModel]
    func addNews(news: [StoryModel])
}

struct NewsDBRepository: NewsDBRepositoryProtocol {
    var persistantStore: NewsDataStoreProtocol

    init(persistantStore: NewsDataStoreProtocol = NewsDataStore()) {
        self.persistantStore = persistantStore
    }

    func getNews() -> [StoryModel] {
        persistantStore.getNews()
    }

    func addNews(news: [StoryModel]) {
        persistantStore.addNews(news: news)
    }
}
