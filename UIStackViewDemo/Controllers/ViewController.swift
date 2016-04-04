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

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case "boxue":
           let destination = segue.destinationViewController as! BoxueViewController
           let url = NSURL(string: "https://www.boxueio.com")
           destination.url = url
        default:
            break
        }
    }

}

