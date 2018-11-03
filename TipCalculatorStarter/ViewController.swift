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
    
   
//    calc logic function
    func calculate() {
        // dismiss keyboard
        if self.billAmountTextField.isFirstResponder {
            self.billAmountTextField.resignFirstResponder()
        }
        
        guard let billAmountText = self.billAmountTextField.text,
            let billAmount = Double(billAmountText) else {
                return
        }
        
//        segmented control is changed
        let roundedBillAmount = (100 * billAmount).rounded() / 100
        
        let tipPercent: Double
        switch tipPercentSegmentedControl.selectedSegmentIndex {
        case 0:
            tipPercent = 0.15
        case 1:
            tipPercent = 0.18
        case 2:
            tipPercent = 0.20
        default:
            preconditionFailure("Unexpected index.")
        }
        
        
        let tipAmount = roundedBillAmount * tipPercent
        let roundedTipAmount = (100 * tipAmount).rounded() / 100
        
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        // Update UI
        self.billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
        self.tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
        self.totalAmountLabel.text = String(format: "%.2f", totalAmount)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.calculateButtonAction = {
            self.calculate()
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
        calculate()
    }
    
//    reset input button
    @IBAction func resetButtonTapped(_ sender: Any) {
        print("reset button tapped")
    }
    
    
    
}

