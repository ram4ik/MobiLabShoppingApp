//
//  ShoppingFormTests.swift
//  MobiLabShoppingAppTests
//
//  Created by ramil on 25.02.2022.
//

import XCTest
@testable import MobiLabShoppingApp

class ShoppingFormTests: XCTestCase {

    func testShoppingForm() {
        
        let item = ShoppingItem(id: 7, title: "Title", notes: "Notes", bought: true, quantity: 8)
        
        let sf = ShoppingForm(item)
        
        XCTAssertEqual(sf.shoppingItemId, 7)
        XCTAssertEqual(sf.title, "Title")
        XCTAssertEqual(sf.notes, "Notes")
        XCTAssertEqual(sf.updating, true)
        XCTAssertEqual(sf.quantity, 8)
    }

}
