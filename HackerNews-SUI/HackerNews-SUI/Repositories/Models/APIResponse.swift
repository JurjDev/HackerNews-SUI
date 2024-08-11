//
//  APIResponse.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation

struct HackerNewsResponse: Codable, Hashable {
    let hits: [NewsEntryResponse]
}

struct NewsEntryResponse: Codable, Hashable {
    let id: String
    let storyTitle: String?
    let title: String?
    let createdAt: Date
    let author: String?
    let storyURL: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id = "objectID"
        case title
        case storyTitle = "story_title"
        case createdAt = "created_at"
        case author
        case storyURL = "story_url"
        case url
    }
}
