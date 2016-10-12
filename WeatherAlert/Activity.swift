//
//  Activity.swift
//  WeatherAlert
//
//  Created by Matt Weems on 10/12/16.
//  Copyright © 2016 Matt Weems. All rights reserved.
//

import Foundation
public class Condition {
    
    var name: String;
    var ideal: Int;
    var max: Int;
    var min: Int;
    
    init(name: String, ideal: Int, max: Int, min:Int){
        self.name = name;
        self.ideal = ideal;
        self.max = max;
        self.min = min;
    }
    
    func getName() -> String {
        return self.name;
    }
    func setName(name: String){
        self.name = name;
    }
    func getIdeal() -> Int {
        return ideal;
    }
    func setIdeal(ideal: Int){
        self.ideal = ideal;
    }
    func getMax() -> Int {
        return self.max;
    }
    func setMax(max: Int){
        self.max = max;
    }
    func getMin() -> Int {
        return self.min;
    }
    func setMin(min: Int){
        self.min = min;
    }
}

public class Activity {
    var title: String;
    var conditions: [Condition];
    
    init(title: String, conditions: [Condition]) {
        self.title = title;
        self.conditions = conditions;
    }
    
    func getTitle() -> String {
        return title;
    }
    
    func getCondition(whichCondition: String) -> Condition {
        var thisCondition = Condition(name: " ",ideal: 0,max: 0,min: 0);
        for condition in conditions where condition.getName() == whichCondition {
            thisCondition = condition;
        }
        return thisCondition;
    }
}