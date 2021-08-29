//
//  ContentView.swift
//  walter
//
//  Created by Heath Borders on 8/28/21.
//

import SwiftUI

struct ContentView: View {
    @State var url: URL?
    
    var body: some View {
        if url == nil {
            TextField(
                "Paste in the URL and press enter: https://app.altarlive.com/stream/WXYZ",
                value: $url,
                formatter: URLFormatter(
                    validator: { url in
                        return url.absoluteString.starts(with: "https://app.altarlive.com/stream/")
                    }
                )
            ).padding()
        }
        Web(url:$url)
    }
}
