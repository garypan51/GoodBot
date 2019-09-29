//
//  WebView.swift
//  GoodBot
//
//  Created by Gary Pan on 9/22/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI
import WebKit
  
struct WebView : UIViewControllerRepresentable {
    let request: URLRequest
      
    func makeUIViewController(context: Context) -> WKWebViewController  {
        let webViewController = WKWebViewController()
        return webViewController
    }
      
    func updateUIViewController(_ webViewController: WKWebViewController, context: Context) {
        webViewController.load(request)
    }
}
  
#if DEBUG
struct WebView_Previews : PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "https://www.apple.com")!))
    }
}
#endif
