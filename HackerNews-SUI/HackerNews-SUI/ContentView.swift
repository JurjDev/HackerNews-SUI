//
//  ContentView.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NewsListView(news: StoryItemModel.mockItems)
    }
}

#Preview {
    ContentView()
}
