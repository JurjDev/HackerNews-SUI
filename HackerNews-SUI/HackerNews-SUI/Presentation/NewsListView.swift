//
//  NewsListView.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import SwiftUI

struct NewsListView: View {
    var news: [StoryItemModel]

    var body: some View {
        List(news) { element in
            StoryItemView(item: element)
        }
        .refreshable {
            news = StoryItemModel.mockItems
        }
    }
}

#Preview {
    NewsListView(news: StoryItemModel.mockItems)
}
