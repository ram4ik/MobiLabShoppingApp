//
//  NewItemUpdateTests.swift
//  MobiLabShoppingAppUITests
//
//  Created by ramil on 25.02.2022.
//

import XCTest

class NewItemUpdateTests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
    }
    
    func testNewItemUpdate() {
        XCTAssertTrue(app.staticTexts["Add New Item"].exists)
        app.staticTexts["Add New Item"].tap()
        
        XCTAssertTrue(app.textFields["Title"].exists)
        app.textFields["Title"].tap()
        app.textFields["Title"].typeText("Milk")
        
        XCTAssertTrue(app.buttons["Save"].exists)
        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.staticTexts["Milk"].exists)
        sleep(1)
        app.buttons["1, Milk"].tap()
        
        XCTAssertTrue(app.buttons["Update"].exists)
        app.buttons["Update"].tap()
        
        XCTAssertTrue(app.staticTexts["Milk"].exists)
        app.buttons["DoneButton"].firstMatch.tap()
        app.buttons["DoneButton"].firstMatch.tap()
        
        XCTAssert(app.buttons["1, Milk"].exists)
        app.staticTexts["Milk"].swipeLeft()
        app.buttons["1, Milk"].swipeLeft()
        
        XCTAssertTrue(app.buttons["Delete"].exists)
        app.buttons["Delete"].tap()
    }
}
