//
//  SettingsViewController.swift
//  tips
//
//  Created by Jim Cai on 3/10/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkAndSetSavedTip()
    }
    
    func checkAndSetSavedTip(){
        let defaults = NSUserDefaults.standardUserDefaults()
        if let tipIndex = defaults.stringForKey("savedTip")
        {
            tipControl.selectedSegmentIndex = tipIndex.toInt()!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveTipDetail" {
            var tipPercentages = [0.18, 0.2, 0.22]
            var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(tipControl.selectedSegmentIndex, forKey: "savedTip")
        }
    }
}
