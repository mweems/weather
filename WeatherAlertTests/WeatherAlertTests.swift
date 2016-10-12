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
    
    func testActivityReturnsCondition() {
        let activity = Activity(title: "activity", conditions: [Condition(name: "first", ideal: 10, max: 20, min: 0)]);
        let condition = activity.getCondition("first");
        let title = activity.getTitle();
        XCTAssert(title == "activity");
        XCTAssert(condition.getIdeal() == 10);
    }
}
