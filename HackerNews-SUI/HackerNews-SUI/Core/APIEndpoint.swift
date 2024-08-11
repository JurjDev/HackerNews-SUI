//
//  APIEndpoint.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation

enum APIEndpoint {
    case hackerNews
}

extension APIEndpoint {
    var urlString: String {
        switch self {
        case .hackerNews:
            return "https://hn.algolia.com/api/v1/search_by_date?query=mobile"
        }
    }
}
