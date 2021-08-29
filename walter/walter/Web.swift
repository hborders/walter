//
//  Web.swift
//  walter
//
//  Created by Heath Borders on 8/28/21.
//

import Foundation
import SwiftUI
import WebKit

struct Web : UIViewRepresentable {
    
    @Binding var url: URL?
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = url {
            uiView.load(URLRequest(url: url))
        } else {
            uiView.stopLoading()
        }
    }
}
