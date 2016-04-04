//
//  StackCell.swift
//  UIStackViewDemo
//
//  Created by laichunhui on 16/3/29.
//  Copyright © 2016年 fingerwave. All rights reserved.
//

import UIKit

class StackCell: UIView {
    var selectedAction: (() -> Void)?
    
    lazy var themeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.textColor = UIColor.grayColor()
        return label
    }()
    
    var isSelected = false {
        didSet {
            themeLabel.textColor = isSelected ?  UIColor.cyanColor() : UIColor.grayColor()
        }
    }
    
    var theme: String? {
        didSet {
            self.themeLabel.text = theme
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        selectedAction?()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.themeLabel.frame = self.bounds
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.addSubview(themeLabel)
    }
}
