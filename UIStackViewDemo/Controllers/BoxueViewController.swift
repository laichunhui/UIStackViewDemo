//
//  BoxueViewController.swift
//  UIStackViewDemo
//
//  Created by laichunhui on 16/4/1.
//  Copyright © 2016年 fingerwave. All rights reserved.
//

import UIKit

class BoxueViewController: UIViewController {

    var url: NSURL?
    @IBOutlet weak var webView: UIWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        loadWebView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = false
    }

    private func loadWebView() {
        
        if let url = self.url {
            let request = NSURLRequest(URL: url)
            self.webView.loadRequest(request)
        }
    }

}
