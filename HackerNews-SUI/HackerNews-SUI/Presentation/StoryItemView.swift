//
//  StoryItemView.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import SwiftUI

struct StoryItemView: View {
    let item: StoryModel
    @State
    private var isPresenting: Bool = false
    @State
    private var isPresentingAlert: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            SUIText(string: item.title,
                    scheme: .title)
            .bold()
            SUIText(string: item.subtitle,
                    scheme: .subTitle)
        }
        .frame(maxWidth: .infinity,
               alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            guard let _ = item.url
            else {
                isPresentingAlert = true
                return
            }
            isPresenting = true
        }
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
                item.isVisible = false
            } label: {
                Label(Constants.Strings.ListDeleteText.value,
                      systemImage: Constants.Icons.trashIcon.value)
            }
        }
        .alert(Constants.Strings.WebViewErrorText.value,
               isPresented: $isPresentingAlert) {
            Button(Constants.Strings.WebViewDismissText.value,
                   role: .cancel) { }
        }
        .sheet(isPresented: $isPresenting) {
            NavigationStack {
                WebView(url: item.url)
            }
        }
    }
}

#Preview {
    let item = StoryModel(id: "",
                          title: "",
                          author: "",
                          createdAt: .now,
                          stringURL: "")
    return StoryItemView(item: item)
}
