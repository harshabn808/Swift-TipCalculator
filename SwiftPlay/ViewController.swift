//
//  ViewController.swift
//  SwiftPlay
//
//  Created by Harsha Badami Nagaraj on 9/2/14.
//  Copyright (c) 2014 Yahoo!. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var tipArray: Array<Double> = [0.1, 0.15, 0.2, 0.25, 0.3];
    var selectedIndex: Int?;
                            
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipAmountField: UILabel!
    @IBOutlet weak var totalAmountField: UILabel!
    @IBOutlet weak var tipSelect: UISegmentedControl!
    @IBAction func onBillAmountChanged(sender: AnyObject) {
        billAmountChanged();
    }
    @IBAction func onTipSelect(sender: UISegmentedControl) {
        billAmountChanged();
    }
    
    func billAmountChanged() {
        var billAmount: Double = NSString(string:billAmountField.text).doubleValue;
        
        updateLabels(calculateTip(billAmount), billAmount: billAmount);
    }
    
    func calculateTip (billAmount:Double) ->Double {
        var selectedIndex: Int = tipSelect.selectedSegmentIndex;
        
        var tipPercent: Double = tipArray[selectedIndex];
        var tipAmount: Double = tipPercent * billAmount;
        
        return tipAmount;
    }
    
    func updateLabels(tipAmount:Double, billAmount: Double) {
        tipAmountField.text = String(format: "$%.2f", tipAmount);
        totalAmountField.text = String(format: "$%.2f", tipAmount+billAmount);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadDefaults();
    }
    
    func loadDefaults() {
        var defaults = NSUserDefaults.standardUserDefaults()
        selectedIndex = defaults.integerForKey("defaultTipPercent");
       
        if selectedIndex == nil {
            selectedIndex = 0;
        }
        tipSelect.selectedSegmentIndex = selectedIndex!;
        billAmountChanged();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

