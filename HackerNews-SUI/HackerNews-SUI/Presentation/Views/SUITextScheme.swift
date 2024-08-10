//
//  SUITextScheme.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import SwiftUI

struct SUITextScheme {
    let font: Font
    let color: Color

    init(font: Font = .title,
         color: Color = .white) {
        self.font = font
        self.color = color
    }
}

extension SUITextScheme {
    static let title: SUITextScheme = {
        .init(font: .title, color: .titleText)
    }()

    static let subTitle: SUITextScheme = {
        .init(font: .subheadline, color: .subTitleText)
    }()
}
