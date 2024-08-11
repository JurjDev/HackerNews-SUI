//
//  NewsUseCase.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation

protocol NewsRepositoryProtocol {
    func getNews(forceCache: Bool) async -> Result<[StoryModel], Error>
}

struct NewsUseCases: NewsRepositoryProtocol {
    var dbRepository: NewsDBRepositoryProtocol
    var apiRepository: NewsApiRepositoryProtocol

    init(dbRepository: NewsDBRepositoryProtocol = NewsDBRepository(),
         apiRepository: NewsApiRepositoryProtocol = NewsApiRepository()) {
        self.dbRepository = dbRepository
        self.apiRepository = apiRepository
    }

    func getNews(forceCache: Bool) async -> Result<[StoryModel], Error> {
        if forceCache {
            let apiResponse = await apiRepository.fetchNews()
            switch apiResponse {
            case .success(let success):
                dbRepository.addNews(news: success.compactMap { $0.model })
            case .failure(let failure):
                return .failure(failure)
            }
        }
        return .success(dbRepository.getNews())
    }
}
