//
//  NewsEntryResponse+CD.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation

extension NewsEntryResponse {
    var model: StoryModel {
        .init(id: self.id,
              title: self.storyTitle ?? self.title ?? "Untitled",
              author: self.author ?? "Unknown",
              createdAt: self.createdAt,
              stringURL: self.storyURL ?? self.url ?? "")
    }
}
