//
//  WebViewController.swift
//  WordOfTheBird
//
//  Created by Banana Viking on 5/4/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    
    override func viewDidLoad() {
        let url = URL(string: "https://en.wikipedia.org/wiki/American_goldfinch")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        super.viewDidLoad()
//        navigationController?.isToolbarHidden = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
