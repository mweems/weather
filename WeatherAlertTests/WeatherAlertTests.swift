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
    
    func testActivityReturnsSingleCondition() {
        let activity = Activity(title: "activity", conditions: [Condition(name: "first", ideal: 10, max: 20, min: 0)]);
        let condition = activity.getCondition("first");
        let title = activity.getTitle();
        XCTAssert(title == "activity");
        XCTAssert(condition.getName() == "first");
        XCTAssert(condition.getIdeal() == 10);
        XCTAssert(condition.getMax() == 20);
        XCTAssert(condition.getMin() == 0);
    }
    
    func testActivityReturnsMultipleConditions() {
        let activity = Activity(title: "activity", conditions: [Condition(name: "first", ideal: 10, max: 20, min: 0), Condition(name: "second", ideal:50, max:100, min:0)]);
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
