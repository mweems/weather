//
//  ConditionChecker.swift
//  WeatherAlert
//
//  Created by Matt Weems on 10/12/16.
//  Copyright © 2016 Matt Weems. All rights reserved.
//

import Foundation

public class ConditionChecker {
    var currentTemp: Double;
    
    init(currentTemp: Double){
        self.currentTemp = currentTemp;
    }
    
    func checkTemp(userCondition: Condition) -> Double {
        let ideal:Double = Double(userCondition.getIdeal());
        if currentTemp < ideal {
            let actualDiff:Double = ideal - self.currentTemp;
            let userDiff:Double = ideal - Double(userCondition.getMin());
            let fract:Double = actualDiff/userDiff;
            let res = fract * 10;
            return 10 - res;
        } else if currentTemp > ideal {
            let actualDiff:Double = self.currentTemp - ideal;
            let userDiff:Double = Double(userCondition.getMax()) - ideal;
            let fract:Double = actualDiff/userDiff;
            let res = fract * 10;
            return 10 - res;
        } else {
            return 10;
        }
        
        
    }
}