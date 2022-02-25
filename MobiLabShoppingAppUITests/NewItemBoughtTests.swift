//
//  NewItemBoughtTests.swift
//  MobiLabShoppingAppUITests
//
//  Created by ramil on 25.02.2022.
//

import XCTest

class NewItemBoughtTests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
    }
    
    func testNewItemBought() {
        XCTAssertTrue(app.staticTexts["Add New Item"].exists)
        app.staticTexts["Add New Item"].tap()
        
        XCTAssertTrue(app.textFields["Title"].exists)
        app.textFields["Title"].tap()
        app.textFields["Title"].typeText("Coconuts")
        
        XCTAssertTrue(app.buttons["Save"].exists)
        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.staticTexts["Coconuts"].exists)
        app.buttons["DoneButton"].tap()
        app.buttons["DoneButton"].tap()
        
        app.buttons["1, Coconuts"].swipeLeft(velocity: .fast)
        
        XCTAssertTrue(app.buttons["Delete"].exists)
        app.buttons["Delete"].tap()
    }
    
}
