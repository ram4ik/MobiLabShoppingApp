//
//  NewItemTests.swift
//  MobiLabShoppingAppUITests
//
//  Created by ramil on 25.02.2022.
//

import XCTest

class NewItemTests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
    }
    
    func testNewItem() {
        XCTAssertTrue(app.staticTexts["Add New Item"].exists)
        app.staticTexts["Add New Item"].tap()
        
        XCTAssertTrue(app.textFields["Title"].exists)
        app.textFields["Title"].tap()
        app.textFields["Title"].typeText("Bananas")
        
        XCTAssertTrue(app.buttons["Save"].exists)
        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.staticTexts["Bananas"].exists)
        
        app.buttons["1, Bananas"].swipeLeft(velocity: .fast)
        
        sleep(4)
        
        XCTAssertTrue(app.buttons["Delete"].exists)
        app.buttons["Delete"].tap()
    }
    
}
