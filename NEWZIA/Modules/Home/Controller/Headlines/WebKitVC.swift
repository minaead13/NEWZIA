//
//  WebKitVC.swift
//  NEWZIA
//
//  Created by Mina on 03/08/2023.
//

import UIKit
import WebKit

class WebKitVC: UIViewController, WKNavigationDelegate {

    // MARK: - IBOutlets.
    @IBOutlet weak var webKit: WKWebView!
    
    // MARK: - Private Variables.
    var headLineURL: String?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions.
    private func setupUI() {
        setupWebKit(headLineURL)
    }
    
    private func setupWebKit(_ url: String?) {
        webKit.navigationDelegate = self
        
        if let url {
            let headLineURL = URL(string: url)!
            DispatchQueue.main.async { [self] in
                webKit.load(URLRequest(url: headLineURL))
            }
            webKit.allowsBackForwardNavigationGestures = true
        } else {
            swiftMessage(title: "Error", body: "This Url Not Founded", color: .error, layout: .centeredView, style: .center)
        }
    }
}
