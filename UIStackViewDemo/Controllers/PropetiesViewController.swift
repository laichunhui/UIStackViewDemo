//
//  PropetiesViewController.swift
//  UIStackViewDemo
//
//  Created by laichunhui on 16/3/29.
//  Copyright © 2016年 fingerwave. All rights reserved.
//

import UIKit

enum StackViewAlignment: String {
    case Fill, Leading, FirstBaseline, Trailing, LastBaseline // FirstBaseline and LastBaseline are only valid for horizontal stacks.
}

enum StackViewDistribution: String {
    case Fill
    
    case FillEqually
    
    case FillProportionally
    
    case EqualSpacing
    
    case EqualCentering
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
        
        axisPanel.addTarget(self, action: #selector(PropertiesViewController.didSelectedSegmentedItem(_:)), forControlEvents: .ValueChanged)
        
        spacingSlider.addTarget(self, action: #selector(PropertiesViewController.spacingValueChanged(_:)), forControlEvents: .ValueChanged)
       
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = false
    }
    
    func didSelectedSegmentedItem(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.observedView.axis = .Horizontal
        case 1:
            self.observedView.axis = .Vertical
        default:
            break
        }
        
        setupAlimentPanel()
    }
    
    func spacingValueChanged(slider: UISlider) {
        observedView.spacing = CGFloat(slider.value)
    }
    
    
    private func setupAlimentPanel() {
        
        var alimentThemes: [StackViewAlignment]
        
        switch observedView.axis {
        case .Horizontal:
            alimentThemes = [StackViewAlignment.Fill, StackViewAlignment.Leading, StackViewAlignment.FirstBaseline, StackViewAlignment.Trailing, StackViewAlignment.LastBaseline]
        case .Vertical:
            alimentThemes = [StackViewAlignment.Fill, StackViewAlignment.Leading, StackViewAlignment.Trailing]
        }
        
        for (index, cell) in alignmentPanel.arrangedSubviews.enumerate() {
            if cell is StackCell {
                // control alimentPanel display under diffrent axis condition
                if index > alimentThemes.count {
                    cell.hidden = true
                    continue
                }
                cell.hidden = false
                
                let cell = cell as! StackCell
                let alignment = alimentThemes[index-1]
                cell.theme = alignment.rawValue
    
                switch  alignment {
                case .Fill:
                    cell.selectedAction = {
                        self.alignmentValueChange(cell)
                        self.observedView.alignment = .Fill
                    }
                case .Leading:
                    cell.selectedAction = {
                        self.alignmentValueChange(cell)
                        self.observedView.alignment = .Leading
                    }
                case .FirstBaseline:
                    cell.selectedAction = {
                        self.alignmentValueChange(cell)
                        self.observedView.alignment = .FirstBaseline
                    }
                case .Trailing:
                    cell.selectedAction = {
                        self.alignmentValueChange(cell)
                        self.observedView.alignment = .Trailing
                    }
                case .LastBaseline:
                    cell.selectedAction = {
                        self.alignmentValueChange(cell)
                        self.observedView.alignment = .LastBaseline
                    }
                }
            }
        }
    }
    
    private func alignmentValueChange(cell: StackCell) {
        
        if self.currentSelectedAlignmentCell != cell {
            self.currentSelectedAlignmentCell?.isSelected = false
            cell.isSelected = true
            self.currentSelectedAlignmentCell = cell
        }
    }
    
    private func distributionValueChange(cell: StackCell) {
        if self.currentSelectedDistributionCell != cell {
            self.currentSelectedDistributionCell?.isSelected = false
            cell.isSelected = true
            self.currentSelectedDistributionCell = cell
        }
    }
    private func setupDistributionPanel() {
        let distributionThemes: [StackViewDistribution] = [.Fill, .FillEqually, .FillProportionally, .EqualSpacing, .EqualCentering]
        
        for (index, cell) in distributionPanel.arrangedSubviews.enumerate() {
            
            if cell is StackCell {
                let cell = cell as! StackCell
                
                let distribution = distributionThemes[index-1]
                cell.theme = distribution.rawValue
               
                switch  distribution {
                case .Fill:
                    cell.selectedAction = {
                        self.distributionValueChange(cell)
                        self.observedView.alignment = .Fill
                    }
                case .FillEqually:
                    cell.selectedAction = {
                        self.distributionValueChange(cell)
                        self.observedView.distribution = .FillEqually
                    }
                case .FillProportionally:
                    cell.selectedAction = {
                        self.distributionValueChange(cell)
                        self.observedView.distribution = .FillProportionally
                    }
                case .EqualSpacing:
                    cell.selectedAction = {
                        self.distributionValueChange(cell)
                        self.observedView.distribution = .EqualSpacing
                    }
                case .EqualCentering:
                    cell.selectedAction = {
                        self.distributionValueChange(cell)
                        self.observedView.distribution = .EqualCentering
                    }
                }
                
            }
        }
    }
    
}