//
//  WKWebViewController.swift
//  GoodBot
//
//  Created by Gary Pan on 9/28/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func load(_ request: URLRequest) {
        print("!!!!!!LOADED!!!!!")
        webView.load(request)
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        print("!!!!!!!!!!POLICY!!!!!!!!!")
        let url = navigationAction.request.url!
        print(url.scheme!)
        let app = UIApplication.shared

        if url.scheme == "goodbot" && app.canOpenURL(url) {
            print("GOT IT")
            app.open(url, options: [:], completionHandler: {(success) in print("Dones")})
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
