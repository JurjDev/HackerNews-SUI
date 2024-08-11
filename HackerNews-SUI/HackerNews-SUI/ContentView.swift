//
//  ContentView.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject
    var viewModel: NewsViewModel = NewsViewModel()

    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .ready,
                 .error:
                NewsListView(news: viewModel.items)
                    .refreshable {
                        Task {
                            await viewModel.fetchNews(forceCache: true)
                        }
                    }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchNews(forceCache: false)
            }
        }
    }
}

#Preview {
    ContentView()
}
