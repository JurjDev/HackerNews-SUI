//
//  NewsViewModel.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation

enum AppState: Hashable {
    case loading
    case ready
    case error
}

final class NewsViewModel: ObservableObject {
    var newsUseCases:NewsRepositoryProtocol
    @Published
    var items: [StoryModel] = []
    @Published
    var state: AppState = .loading

    init(newsUseCases: NewsRepositoryProtocol = NewsUseCases()) {
        self.newsUseCases = newsUseCases
        self.items = items
        self.state = state
    }

    private func updateState(newState: AppState) async {
        await MainActor.run {
            if newState != state {
                state = newState
            }
        }
    }

    private func updateNews(_ news: [StoryModel]) async {
        await MainActor.run {
            items = news
        }
        await updateState(newState: .ready)
    }
}

extension NewsViewModel {
    func fetchNews(forceCache: Bool) async {
        let results = await newsUseCases.getNews(forceCache: forceCache)
        switch results {
        case .success(let success):
            await updateNews(success)
        case .failure:
            await updateState(newState: .error)
        }
    }
}
