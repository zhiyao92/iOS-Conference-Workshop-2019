//
//  WKNavigationView.swift
//  HackingWithSwift
//
//  Created by Kelvin Tan on 1/17/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit
import WebKit

class WKNavigationView: NSObject, WKNavigationDelegate {

    var webView = WKWebView()
    var allowedSites = [String]()

    init(sites: [String]) {
        self.allowedSites = sites
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let host = navigationAction.request.url?.host {
            if allowedSites.contains(where: host.contains) {
                decisionHandler(.allow)
                return
            }
        }

        if let url = navigationAction.request.url {
            UIApplication.shared.open(url, options: [:])
        }

        decisionHandler(.cancel)
    }
}
