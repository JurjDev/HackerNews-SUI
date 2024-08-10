//
//  WebView.swift
//  HackerNews-SUI
//
//  Created by JurjDev on 10/08/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL?

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url
        else { return } 
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
