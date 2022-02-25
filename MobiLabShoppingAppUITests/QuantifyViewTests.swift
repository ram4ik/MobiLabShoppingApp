//
//  QuantifyViewTests.swift
//  MobiLabShoppingAppUITests
//
//  Created by ramil on 25.02.2022.
//

import XCTest

class QuantifyViewTests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
    }
    
    func testQuantifyView() {
        
        XCTAssertTrue(app.staticTexts["Add New Item"].exists)
        app.staticTexts["Add New Item"].tap()
        
        XCTAssertTrue(app.staticTexts["Quantity"].exists)
        app.buttons["Quantity"].tap()
        
        XCTAssertTrue(app.buttons["Shopping Form"].exists)
        app.buttons["Shopping Form"].tap()
        
        app.buttons["Quantity"].tap()
        
        app.swipeDown(velocity: .fast)
    }
    
}
