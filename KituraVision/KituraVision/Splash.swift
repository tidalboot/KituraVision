//
//  ViewController.swift
//  WebSpinner
//
//  Created by Nick Jones on 26/06/2017.
//  Copyright © 2017 NickJones. All rights reserved.
//

import UIKit

class Splash: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var OrangePage: UIWebView!
    @IBOutlet var OrangeLoadingLabel: UILabel!
    
    @IBOutlet var RedPage: UIWebView!
    @IBOutlet var RedLoadingLabel: UILabel!
    
    @IBOutlet var BluePage: UIWebView!
    @IBOutlet var BlueLoadingLabel: UILabel!
    
    private let orangeEndpoint = "http://localhost:8080/orange.html"
    private let redEndpoint = "http://localhost:8080/red.html"
    private let blueEndpoint = "http://localhost:8080/ble.html"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OrangePage.delegate = self
        RedPage.delegate = self
        BluePage.delegate = self
        reloadPages()
    }
    
    @IBAction func reloadPages() {
        
        OrangeLoadingLabel.text = "Loading First Page..."
        RedLoadingLabel.text = "Loading Second Page..."
        BlueLoadingLabel.text = "Loading Last Page..."
        
        if let orangeURL = URL(string: orangeEndpoint),
            let redURL = URL(string: redEndpoint),
            let blueURL = URL(string: blueEndpoint) {
            OrangePage.loadRequest(URLRequest(url: orangeURL))
            RedPage.loadRequest(URLRequest(url: redURL))
            BluePage.loadRequest(URLRequest(url: blueURL))
        }
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        switch webView {
        case OrangePage:
            OrangeLoadingLabel.text = "😱"
            break
        case RedPage:
            RedLoadingLabel.text = "😱"
            break
        case BluePage:
            BlueLoadingLabel.text = "😱"
            break
        default:
            break
        }
    }
}







