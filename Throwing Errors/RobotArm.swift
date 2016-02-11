
//
//  RobotArm.swift
//  Throwing Errors
//
//  Created by Randall Mardus on 2/11/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import Foundation

enum RobotArmErrors: ErrorType {
    case ServoStuck
    case Unplugged
    case LowBattery(minLevel: Int)
}

struct RobotArm {
    
    var battery: Int = 0
    var pluggedIn: Bool = false
    
    func isPluggedIn() throws ->Bool {
        
        guard pluggedIn else {
            throw RobotArmErrors.Unplugged
        }
        return true
    }
    
    func batteryCheck() throws {
        if battery < 30 {
            throw RobotArmErrors.LowBattery(minLevel: 30)
        }
    }
}