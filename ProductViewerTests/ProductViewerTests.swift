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
    
    struct OfferJson {
        let id: String
        let url: String?
        let name: String
        let description: String
        let terms: String
        let currentValue: String
        
        var dictionary: [String: Any?] {
            return [
                "id": id,
                "url": url,
                "name": name,
                "description": description,
                "terms": terms,
                "current_value": currentValue
            ]
        }
    }
    
    private let offerJsonStruct1 = OfferJson(id: "110579",
                                             url: "https://product-images.ibotta.com/offer/dUxYcQPeq391-DiywFZF8g-normal.png",
                                             name: "Scotch-Brite® Scrub Dots Non-Scratch Scrub Sponges",
                                             description: "Any variety - 2 ct. pack or larger",
                                             terms: "Rebate valid on Scotch-Brite® Scrub Dots Non-Scratch Scrub Sponges for any variety, 2 ct. pack or larger.",
                                             currentValue: "$0.75 Cash Back")
    
    private let offerJsonStruct2 = OfferJson(id: "120331",
                                             url: nil,
                                             name: "Carapelli® Olive Oil",
                                             description: "Any variety - Any size",
                                             terms: "Rebate on Carapelli® Olive Oil for any variety, any size.",
                                             currentValue: "$1.50 Cash Back")
    
    func testOfferInitJson() {
        var offer: Offer
        
        do {
            offer = try encodeDecode(jsonObject: offerJsonStruct1.dictionary, type: Offer.self)
            
            XCTAssertEqual(offerJsonStruct1.id, offer.id)
            
        } catch {
            XCTFail("Failed to decode JSON data using \(Offer.self).")
        }
    }
    
    func testOfferInitJsonList() {
        let offerJsonList = [offerJsonStruct1.dictionary, offerJsonStruct2.dictionary]
        var offers: [Offer]
        
        do {
            offers = try encodeDecode(jsonObject: offerJsonList, type: [Offer].self)
            
            XCTAssertEqual(offerJsonStruct1.id, offers.first?.id)
            XCTAssertEqual(offerJsonStruct2.id, offers.last?.id)
            
        } catch {
            XCTFail("Failed to decode JSON data using \([Offer].self).")
        }
    }
    
    func testOfferToggle() {
        var offer: Offer
        
        do {
            offer = try encodeDecode(jsonObject: offerJsonStruct1.dictionary, type: Offer.self)
            
            XCTAssertEqual(offerJsonStruct1.id, offer.id)
            XCTAssertFalse(offer.isFavorited)
            offer.toggleFavorited()
            XCTAssertTrue(offer.isFavorited)
            
        } catch {
            XCTFail("Failed to decode JSON data using \(Offer.self).")
        }
    }
    
    private func encodeDecode<T: Decodable>(jsonObject: Any, type: T.Type) throws -> T {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
        return try JSONDecoder().decode(type, from: jsonData)
    }
    
}
