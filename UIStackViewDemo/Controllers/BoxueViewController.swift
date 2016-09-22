//
//  BoxueViewController.swift
//  UIStackViewDemo
//
//  Created by laichunhui on 16/4/1.
//  Copyright © 2016年 fingerwave. All rights reserved.
//

import UIKit

class BoxueViewController: UIViewController {

    var url: URL?
    @IBOutlet weak var webView: UIWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        loadWebView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    fileprivate func loadWebView() {
        
        if let url = self.url {
            let request = URLRequest(url: url)
            self.webView.loadRequest(request)
        }
    }

}
