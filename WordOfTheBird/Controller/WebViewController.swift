//
//  WebViewController.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 9/24/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var link: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let link = link, let url = URL(string: link) {
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            if host.contains("wikipedia") || host.contains("wikimedia") {
                decisionHandler(.allow)
                return
            }
        }
        decisionHandler(.cancel)
    }
}
