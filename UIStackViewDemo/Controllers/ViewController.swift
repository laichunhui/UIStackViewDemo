//
//  ViewController.swift
//  UIStackViewDemo
//
//  Created by laichunhui on 16/4/1.
//  Copyright © 2016年 fingerwave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case "boxue":
           let destination = segue.destination as! BoxueViewController
           let url = URL(string: "https://www.boxueio.com")
           destination.url = url
        default:
            break
        }
    }

}

