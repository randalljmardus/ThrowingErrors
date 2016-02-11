//
//  ViewController.swift
//  Throwing Errors
//
//  Created by Randall Mardus on 2/11/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        var mechArm = RobotArm(battery: 50, pluggedIn: false)
    
        do {
            try mechArm.isPluggedIn()
        }
        catch RobotArmErrors.Unplugged {
            print("Warning: Your device is not plugged in.")
        }
        catch _ {
            print("Unspecified error occurred, reboot :)")
        }
        
        mechArm.battery = 15
        
        do {
            try mechArm.batteryCheck()
        }
        catch RobotArmErrors.LowBattery(minLevel: 30) {
        print("Warning from battery check: Low Battery. Device will shut off soon.")
        }
        catch {
            print("Unspecified error occurred, reboot :)")
        }
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

