//
//  NewsListView.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import SwiftUI

struct NewsListView: View {
    var news: [StoryModel]

    var body: some View {
        List(news) { element in
            StoryItemView(item: element)
        }
    }
}
