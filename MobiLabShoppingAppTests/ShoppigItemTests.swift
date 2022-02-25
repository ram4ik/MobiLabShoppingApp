//
//  ShoppigItemTests.swift
//  MobiLabShoppingAppTests
//
//  Created by ramil on 25.02.2022.
//

import XCTest
@testable import MobiLabShoppingApp

class ShoppigItemTests: XCTestCase {

    func testShoppingItem() {
        
        let si = ShoppingItem(id: 1, title: "Title", notes: "Notes", bought: false, quantity: 9)
        
        XCTAssertEqual(si.id, 1)
        XCTAssertEqual(si.title, "Title")
        XCTAssertEqual(si.notes, "Notes")
        XCTAssertEqual(si.bought, false)
        XCTAssertEqual(si.quantity, 9)
    }

}
