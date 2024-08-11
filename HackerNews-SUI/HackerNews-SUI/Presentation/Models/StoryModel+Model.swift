//
//  StoryModel+Model.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation

extension StoryModel {
    var elapsed: String {
        DateFormat(withDate: self.createdAt).description
    }

    var subtitle: String {
        "\(author) - \(elapsed)"
    }

    var url: URL? {
        URL(string: stringURL)
    }
}
