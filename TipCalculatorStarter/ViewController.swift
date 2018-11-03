//
//  ViewController.swift
//  TipCalculatorStarter
//
//  Created by Chase Wang on 9/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - View Lifecycle
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    //    INPUT CARD OUTLETS
    @IBOutlet weak var inputCardView: UIView!
    @IBOutlet weak var billAmountTextField: BillAmountTextField!
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    
    //    OUTPUT CARD OUTLETS
    @IBOutlet weak var outputCardView: UIView!
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountTitleLable: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    //    BUTTON OUTLET
    @IBOutlet weak var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.calculateButtonAction = {
            guard let billAmountText = self.billAmountTextField.text
                else { return }
            
            print("Bill Amount: \(billAmountText)")
        }
    }
    
    
    //    IB ACTIONS
//    change the theme
    @IBAction func themeToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("switch toggled on")
        } else {
            print("switch toggled off")
        }
    }
    
//    change tip percentage
    @IBAction func tipPercentageChanged(_ sender: UISegmentedControl) {
    }
    
//    reset input button
    @IBAction func resetButtonTapped(_ sender: Any) {
        print("reset button tapped")
    }
    
    
    
}

