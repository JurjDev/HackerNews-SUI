//
//  StoryModel.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation
import SwiftData

@Model
final class StoryModel {
    @Attribute(.unique)
    var id: String
    let title: String
    let author: String
    let createdAt: Date
    let stringURL: String
    var isVisible: Bool

    init(id: String, 
         title: String,
         author: String,
         createdAt: Date,
         stringURL: String,
         isVisible: Bool = true) {
        self.id = id
        self.title = title
        self.author = author
        self.createdAt = createdAt
        self.stringURL = stringURL
        self.isVisible = isVisible
    }
}
