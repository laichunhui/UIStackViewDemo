//
//  PropetiesViewController.swift
//  UIStackViewDemo
//
//  Created by laichunhui on 16/3/29.
//  Copyright © 2016年 fingerwave. All rights reserved.
//

import UIKit

enum StackViewAlignment: String {
    case fill, leading, firstBaseline, trailing, lastBaseline // FirstBaseline and LastBaseline are only valid for horizontal stacks.
}

enum StackViewDistribution: String {
    case fill
    
    case fillEqually
    
    case fillProportionally
    
    case equalSpacing
    
    case equalCentering
}

class PropertiesViewController: UIViewController {
    
    @IBOutlet weak var axisPanel: UISegmentedControl!
    @IBOutlet weak var distributionPanel: UIStackView!
    @IBOutlet weak var observedView: UIStackView!
    @IBOutlet weak var alignmentPanel: UIStackView!
    @IBOutlet weak var spacingSlider: UISlider!
    
    var currentSelectedAlignmentCell: StackCell?
    var currentSelectedDistributionCell: StackCell?
    
    override func viewDidLoad() {
        
        axisPanel.addTarget(self, action: #selector(PropertiesViewController.didSelectedSegmentedItem(_:)), for: .valueChanged)
        
        spacingSlider.addTarget(self, action: #selector(PropertiesViewController.spacingValueChanged(_:)), for: .valueChanged)
       
        setupAlimentPanel()
        
        setupDistributionPanel()
        
        // default is Fill distribution and Fill alignment
        if let distributionCell = distributionPanel.arrangedSubviews[1] as? StackCell {
            distributionCell.isSelected = true
            self.currentSelectedDistributionCell = distributionCell
        }
        if let alimentCell = alignmentPanel.arrangedSubviews[1] as? StackCell {
            alimentCell.isSelected = true
            self.currentSelectedAlignmentCell = alimentCell
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func didSelectedSegmentedItem(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.observedView.axis = .horizontal
        case 1:
            self.observedView.axis = .vertical
        default:
            break
        }
        
        setupAlimentPanel()
    }
    
    func spacingValueChanged(_ slider: UISlider) {
        observedView.spacing = CGFloat(slider.value)
    }
    
    
    fileprivate func setupAlimentPanel() {
        
        var alimentThemes: [StackViewAlignment]
        
        switch observedView.axis {
        case .horizontal:
            alimentThemes = [StackViewAlignment.fill, StackViewAlignment.leading, StackViewAlignment.firstBaseline, StackViewAlignment.trailing, StackViewAlignment.lastBaseline]
        case .vertical:
            alimentThemes = [StackViewAlignment.fill, StackViewAlignment.leading, StackViewAlignment.trailing]
        }
        
        for (index, cell) in alignmentPanel.arrangedSubviews.enumerated() {
            if cell is StackCell {
                // control alimentPanel display under diffrent axis condition
                if index > alimentThemes.count {
                    cell.isHidden = true
                    continue
                }
                cell.isHidden = false
                
                let cell = cell as! StackCell
                let alignment = alimentThemes[index-1]
                cell.theme = alignment.rawValue
    
                switch  alignment {
                case .fill:
                    cell.selectedAction = {
                        self.alignmentValueChange(cell)
                        self.observedView.alignment = .fill
                    }
                case .leading:
                    cell.selectedAction = {
                        self.alignmentValueChange(cell)
                        self.observedView.alignment = .leading
                    }
                case .firstBaseline:
                    cell.selectedAction = {
                        self.alignmentValueChange(cell)
                        self.observedView.alignment = .firstBaseline
                    }
                case .trailing:
                    cell.selectedAction = {
                        self.alignmentValueChange(cell)
                        self.observedView.alignment = .trailing
                    }
                case .lastBaseline:
                    cell.selectedAction = {
                        self.alignmentValueChange(cell)
                        self.observedView.alignment = .lastBaseline
                    }
                }
            }
        }
    }
    
    fileprivate func alignmentValueChange(_ cell: StackCell) {
        
        if self.currentSelectedAlignmentCell != cell {
            self.currentSelectedAlignmentCell?.isSelected = false
            cell.isSelected = true
            self.currentSelectedAlignmentCell = cell
        }
    }
    
    fileprivate func distributionValueChange(_ cell: StackCell) {
        if self.currentSelectedDistributionCell != cell {
            self.currentSelectedDistributionCell?.isSelected = false
            cell.isSelected = true
            self.currentSelectedDistributionCell = cell
        }
    }
    fileprivate func setupDistributionPanel() {
        let distributionThemes: [StackViewDistribution] = [.fill, .fillEqually, .fillProportionally, .equalSpacing, .equalCentering]
        
        for (index, cell) in distributionPanel.arrangedSubviews.enumerated() {
            
            if cell is StackCell {
                let cell = cell as! StackCell
                
                let distribution = distributionThemes[index-1]
                cell.theme = distribution.rawValue
               
                switch  distribution {
                case .fill:
                    cell.selectedAction = {
                        self.distributionValueChange(cell)
                        self.observedView.alignment = .fill
                    }
                case .fillEqually:
                    cell.selectedAction = {
                        self.distributionValueChange(cell)
                        self.observedView.distribution = .fillEqually
                    }
                case .fillProportionally:
                    cell.selectedAction = {
                        self.distributionValueChange(cell)
                        self.observedView.distribution = .fillProportionally
                    }
                case .equalSpacing:
                    cell.selectedAction = {
                        self.distributionValueChange(cell)
                        self.observedView.distribution = .equalSpacing
                    }
                case .equalCentering:
                    cell.selectedAction = {
                        self.distributionValueChange(cell)
                        self.observedView.distribution = .equalCentering
                    }
                }
                
            }
        }
    }
    
}
