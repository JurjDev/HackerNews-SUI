//
//  NewsDataStore.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation
import SwiftData

protocol NewsDataStoreProtocol {
    func getNews() -> [StoryModel]
    func addNews(news: [StoryModel])
}

struct NewsDataStore: NewsDataStoreProtocol {
    private let container: ModelContainer?
    private let context: ModelContext?

    init() {
        guard let container = try? ModelContainer(for: StoryModel.self)
        else { fatalError("Container could not be initialized") }
        self.container = container
        self.context = ModelContext(container)
    }

    func getNews() -> [StoryModel] {
        let predicate = #Predicate<StoryModel> { $0.isVisible == true }
        let descriptor = FetchDescriptor<StoryModel>(predicate: predicate)
        let scans = try? context?.fetch(descriptor)
        return scans ?? []
    }
    
    func addNews(news: [StoryModel]) {
        news.forEach {
            context?.insert($0)
        }
        try? context?.save()
    }
}
