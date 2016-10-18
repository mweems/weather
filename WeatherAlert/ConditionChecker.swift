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
        let ideal = Double(userCondition.getIdeal());
        if ideal == currentTemp {
            return 10;
        }
        if currentTemp >= Double(userCondition.getMax()) || currentTemp <= Double(userCondition.getMin()) {
            return 0;
        }
        let actualDiff = abs(self.currentTemp - ideal);
        var userDiff:Double = 0;
        
        if currentTemp < ideal {
            userDiff = ideal - Double(userCondition.getMin());
        } else if currentTemp > ideal {
            userDiff = Double(userCondition.getMax()) - ideal;
        }
        
        let fract:Double = actualDiff/userDiff;
        let res = fract * 10;
        return 10 - res;
        
    }
}