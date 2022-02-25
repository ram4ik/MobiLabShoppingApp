//
//  AppUITests.swift
//  MobiLabShoppingAppUITests
//
//  Created by ramil on 25.02.2022.
//

import XCTest

class AppUITests: XCTestCase {
    
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
    
    func testNewItem() {
        XCTAssertTrue(app.staticTexts["Add New Item"].exists)
        app.staticTexts["Add New Item"].tap()
        
        XCTAssertTrue(app.textFields["Title"].exists)
        app.textFields["Title"].tap()
        app.textFields["Title"].typeText("Bananas")
        
        XCTAssertTrue(app.buttons["Save"].exists)
        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.staticTexts["Bananas"].exists)
        app.staticTexts["Bananas"].swipeLeft(velocity: .fast)
        app.buttons["1, Bananas"].swipeLeft(velocity: .fast)
        
        XCTAssertTrue(app.buttons["Delete"].exists)
        app.buttons["Delete"].tap()
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
        app.staticTexts["Coconuts"].swipeLeft(velocity: .fast)
        app.buttons["1, Coconuts"].swipeLeft(velocity: .fast)
        
        XCTAssertTrue(app.buttons["Delete"].exists)
        app.buttons["Delete"].tap()
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
        app.buttons["DoneButton"].tap()
        app.buttons["DoneButton"].tap()
        
        XCTAssert(app.buttons["1, Milk"].exists)
        app.staticTexts["Milk"].swipeLeft()
        app.buttons["1, Milk"].swipeLeft()
        
        XCTAssertTrue(app.buttons["Delete"].exists)
        app.buttons["Delete"].tap()
    }
    
}
