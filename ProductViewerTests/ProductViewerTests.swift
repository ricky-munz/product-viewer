//
//  ProductViewerTests.swift
//  ProductViewerTests
//
//  Created by Richard S. Munz on 12/10/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import XCTest
@testable import ProductViewer

class ProductViewerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testOfferInitJson() {
        let id = "110579"
        let offerDict: [String: Any?] = [
            "id": id,
            "url":"https://product-images.ibotta.com/offer/dUxYcQPeq391-DiywFZF8g-normal.png",
            "name":"Scotch-Brite® Scrub Dots Non-Scratch Scrub Sponges",
            "description":"Any variety - 2 ct. pack or larger",
            "terms":"Rebate valid on Scotch-Brite® Scrub Dots Non-Scratch Scrub Sponges for any variety, 2 ct. pack or larger.",
            "current_value":"$0.75 Cash Back"
        ]
        var offer: Offer
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: offerDict, options: .prettyPrinted)
            print(jsonData)
            offer = try JSONDecoder().decode(Offer.self, from: jsonData)
            
            XCTAssertEqual(id, offer.id)
            
        } catch {
            XCTFail("Failed to decode JSON data using Offer protocol.")
        }
    }
    
    func testOfferToggle() {
        
    }
    
}
