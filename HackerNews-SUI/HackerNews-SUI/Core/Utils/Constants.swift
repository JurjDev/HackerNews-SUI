//
//  Constants.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import Foundation

enum Constants {}

// MARK: - Strings
extension Constants {
    enum Strings {
        case ListDeleteText
        case WebViewErrorText
        case WebViewDismissText
    }
}

extension Constants.Strings {
    var value: String {
        switch self {
        case .ListDeleteText: return "Delete"
        case .WebViewErrorText: return "Invalid URL"
        case .WebViewDismissText: return "Dismiss"
        }
    }
}

// MARK: - Icons
extension Constants {
    enum Icons {
        case trashIcon
    }
}

extension Constants.Icons {
    var value: String {
        switch self {
        case .trashIcon: return "trash"
        }
    }
}
