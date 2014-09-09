//
//  SettingsViewController.swift
//  SwiftPlay
//
//  Created by Harsha Badami Nagaraj on 9/8/14.
//  Copyright (c) 2014 Yahoo!. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSelect: UISegmentedControl!
    
    @IBAction func onTipPercentSelect(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipSelect.selectedSegmentIndex, forKey: "defaultTipPercent");
        defaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var selectedIndex:Int? = defaults.integerForKey("defaultTipPercent");
        
        if selectedIndex == nil {
            selectedIndex = 0;
        }

        tipSelect.selectedSegmentIndex = selectedIndex!;
    }
    
}
