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
        label.textAlignment = .center
        label.textColor = UIColor.gray
        return label
    }()
    
    var isSelected = false {
        didSet {
            themeLabel.textColor = isSelected ?  UIColor.cyan : UIColor.gray
        }
    }
    
    var theme: String? {
        didSet {
            self.themeLabel.text = theme
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

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
