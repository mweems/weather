//
//  WeatherAlertTests.swift
//  WeatherAlertTests
//
//  Created by Matt Weems on 10/12/16.
//  Copyright © 2016 Matt Weems. All rights reserved.
//

import XCTest
@testable import WeatherAlert


class WeatherAlertTests: XCTestCase {
    
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
    }

    
    func testActivityReturnsSingleCondition() {
        let activity = Activity(title: "activity",
                                conditions: [
                                    Condition(name: "first", ideal: 10, max: 20, min: 0)]);
        
        let condition = activity.getCondition("first");
        let title = activity.getTitle();
        
        XCTAssert(title == "activity");
        XCTAssert(condition.getName() == "first");
        XCTAssert(condition.getIdeal() == 10);
        XCTAssert(condition.getMax() == 20);
        XCTAssert(condition.getMin() == 0);
    }
    
    func testActivityReturnsMultipleConditions() {
        let activity = Activity(title: "activity",
                                conditions: [
                                    Condition(name: "first", ideal: 10, max: 20, min: 0),
                                    Condition(name: "second", ideal:50, max:100, min:0)]);
        
        let condition1 = activity.getCondition("first");
        let condition2 = activity.getCondition("second");
        
        XCTAssert(condition1.getName() == "first");
        XCTAssert(condition1.getIdeal() == 10);
        XCTAssert(condition1.getMax() == 20);
        XCTAssert(condition1.getMin() == 0);
        XCTAssert(condition2.getName() == "second");
        XCTAssert(condition2.getIdeal() == 50);
        XCTAssert(condition2.getMax() == 100);
        XCTAssert(condition2.getMin() == 0);
    }
}
