//
//  ShoppingItemDBTests.swift
//  MobiLabShoppingAppTests
//
//  Created by ramil on 25.02.2022.
//

import XCTest
@testable import MobiLabShoppingApp

class ShoppingItemDBTests: XCTestCase {

    func testShoppingItemDB() {
        
        let sidb = ShoppingItemDB()
        
        XCTAssertEqual(sidb.id, 0)
        XCTAssertEqual(sidb.title, "")
        XCTAssertEqual(sidb.notes, "")
        XCTAssertEqual(sidb.quantity, 1)
        XCTAssertEqual(sidb.bought, false)
        
    }
}
