//
//  SUIText.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import SwiftUI

struct SUIText: View {
    let string: String
    let scheme: SUITextScheme

    var body: some View {
        Text(string)
            .font(scheme.font)
            .foregroundStyle(scheme.color)
    }
}

#Preview {
    SUIText(string: "Text", scheme: .title)
}
