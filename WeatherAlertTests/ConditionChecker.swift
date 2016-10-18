//
//  ConditionChecker.swift
//  WeatherAlert
//
//  Created by Matt Weems on 10/15/16.
//  Copyright © 2016 Matt Weems. All rights reserved.
//

import XCTest
@testable import WeatherAlert

class ConditionCheckerTemperatureTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConditionCheckerWhenIdeal() {
        let cc = ConditionChecker(currentTemp:10);
        let activity = Activity(title: "activity",
                                conditions: [
                                    Condition(name: "temp", ideal: 10, max: 20, min: 0)]);
        let condition = activity.getCondition("temp");
        let res = cc.checkTemp(condition);
        XCTAssert(res == 10);
    }
    
    func testConditionCheckerWhenGreaterThanIdeal() {
        let cc = ConditionChecker(currentTemp:15);
        let activity = Activity(title: "activity",
                                conditions: [
                                    Condition(name: "temp", ideal: 10, max: 20, min: 0)]);
        let condition = activity.getCondition("temp");
        let res = cc.checkTemp(condition);
        XCTAssert(res == 5);
        
        let cc1 = ConditionChecker(currentTemp:18);
        let activity1 = Activity(title: "activity",
                                 conditions: [
                                    Condition(name: "temp", ideal: 10, max: 20, min: 0)]);
        let condition1 = activity1.getCondition("temp");
        let res1 = cc1.checkTemp(condition1);
        XCTAssert(res1 == 2);
        
        let bcc = ConditionChecker(currentTemp:75);
        let bactivity = Activity(title: "activity",
                                 conditions: [
                                    Condition(name: "temp", ideal: 50, max: 100, min: 0)]);
        let bcondition = bactivity.getCondition("temp");
        let bres = bcc.checkTemp(bcondition);
        XCTAssert(bres == 5);
        
        let bcc1 = ConditionChecker(currentTemp:90);
        let bactivity1 = Activity(title: "activity",
                                  conditions: [
                                    Condition(name: "temp", ideal: 50, max: 100, min: 0)]);
        let bcondition1 = bactivity1.getCondition("temp");
        let bres1 = bcc1.checkTemp(bcondition1);
        XCTAssert(bres1 == 2);
        
    }
    
    func testConditionCheckerWhenLessThanIdeal() {
        let cc = ConditionChecker(currentTemp:5);
        let activity = Activity(title: "activity",
                                conditions: [
                                    Condition(name: "temp", ideal: 10, max: 20, min: 0)]);
        let condition = activity.getCondition("temp");
        let res = cc.checkTemp(condition);
        XCTAssert(res == 5);
        
        let cc1 = ConditionChecker(currentTemp:2);
        let activity1 = Activity(title: "activity",
                                 conditions: [
                                    Condition(name: "temp", ideal: 10, max: 20, min: 0)]);
        let condition1 = activity1.getCondition("temp");
        let res1 = cc1.checkTemp(condition1);
        XCTAssert(res1 == 2);
        
        let bcc = ConditionChecker(currentTemp:25);
        let bactivity = Activity(title: "activity",
                                 conditions: [
                                    Condition(name: "temp", ideal: 50, max: 100, min: 0)]);
        let bcondition = bactivity.getCondition("temp");
        let bres = bcc.checkTemp(bcondition);
        XCTAssert(bres == 5);
        
        let bcc1 = ConditionChecker(currentTemp:10);
        let bactivity1 = Activity(title: "activity",
                                  conditions: [
                                    Condition(name: "temp", ideal: 50, max: 100, min: 0)]);
        let bcondition1 = bactivity1.getCondition("temp");
        let bres1 = bcc1.checkTemp(bcondition1);
        XCTAssert(bres1 == 2);
        
    }

}
