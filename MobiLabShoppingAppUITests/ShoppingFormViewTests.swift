//
//  ShoppingFormViewTests.swift
//  MobiLabShoppingAppUITests
//
//  Created by ramil on 25.02.2022.
//

import XCTest

class ShoppingFormViewTests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
    }
    
    func testShoppingFormView() {
        
        XCTAssertTrue(app.staticTexts["Add New Item"].exists)
        app.staticTexts["Add New Item"].tap()
        
        XCTAssertTrue(app.staticTexts["Shopping Form"].exists)
        XCTAssertTrue(app.buttons["Cancel"].exists)
        XCTAssertTrue(app.buttons["Save"].exists)
        XCTAssertTrue(app.textFields["Title"].exists)
        XCTAssertTrue(app.staticTexts["Quantity"].exists)
        XCTAssertTrue(app.staticTexts["1"].exists)
        XCTAssertTrue(app.staticTexts["Notes"].exists)
        
        app.buttons["Cancel"].tap()
        
        app.staticTexts["Add New Item"].tap()
        
        app.swipeDown(velocity: .fast)
    }
    
}
