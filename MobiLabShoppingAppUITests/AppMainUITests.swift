//
//  AppUITests.swift
//  MobiLabShoppingAppUITests
//
//  Created by ramil on 25.02.2022.
//

import XCTest

class AppMainUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
    }
    
    func testMainView() {
        
        XCTAssertTrue(app.staticTexts["MobiLab Shopper"].exists)
        XCTAssertTrue(app.staticTexts["Items to shop"].exists)
        XCTAssertTrue(app.staticTexts["Add some shopping items before you go to grocery shopping"].exists)
        XCTAssertTrue(app.staticTexts["Already in cart"].exists)
        XCTAssertTrue(app.staticTexts["Buy something and it will show up here"].exists)
        XCTAssertTrue(app.staticTexts["Add New Item"].exists)
    }
    
}
