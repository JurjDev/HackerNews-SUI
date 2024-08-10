//
//  StoryItemView.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation

struct StoryItemModel: Identifiable {
    let id: String
    let title: String
    let author: String?
    let elapsed: String?
    let stringURL: String?
    let deleteAction: (() -> Void)? = nil
}

extension StoryItemModel {
    var subtitle: String {
        "\(author ?? "") - \(elapsed ?? "")"
    }

    var url: URL? {
        URL(string: stringURL ?? "")
    }
}

#if DEBUG
extension StoryItemModel {
    static var mockItem: StoryItemModel {
        .init(id: "0",
              title: "Title0",
              author: "Author0",
              elapsed: "1m",
              stringURL: "https://www.google.com")
    }

    static var mockItem1: StoryItemModel {
        .init(id: "1",
              title: "Title1",
              author: "Author1",
              elapsed: "10m",
              stringURL: "")
    }

    static var mockItem2: StoryItemModel {
        .init(id: "2",
              title: "Title2",
              author: "Author2",
              elapsed: "1h",
              stringURL: "https://www.apple.com")
    }

    static var mockItems: [StoryItemModel] {
        [mockItem, mockItem1, mockItem2]
    }
}
#endif
