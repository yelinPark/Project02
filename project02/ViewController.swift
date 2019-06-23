//
//  ViewController.swift
//  project02
//
//  Created by SWUCOMPUTER on 21/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var labelStatus: UILabel!
    @IBOutlet var toggleswitch: UISwitch!
    @IBOutlet var startButton: UIButton!
    
    
    
    
    @IBAction func toggleSwitch() {
        if(toggleswitch.isOn)
        {
            labelStatus.text = "Power On"
            startButton.isHidden = false
        }
        else
        {
            labelStatus.text = "Power Off"
            startButton.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }


}

