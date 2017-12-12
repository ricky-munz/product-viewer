//
//  Offer.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import Foundation

class Offer: Decodable {
    var id: String
    var url: String?
    var name: String
    var description: String
    var terms: String
    var value: String
    var isFavorited: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
        case description
        case terms
        case value = "current_value"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        url = try values.decode(String?.self, forKey: .url)
        name = try values.decode(String.self, forKey: .name)
        description = try values.decode(String.self, forKey: .description)
        terms = try values.decode(String.self, forKey: .terms)
        value = try values.decode(String.self, forKey: .value)
        
        isFavorited = false
    }
    
    init(id: String, url: String, name: String, description: String, terms: String, value: String) {
        self.id = id
        self.url = url
        self.name = name
        self.description = description
        self.terms = terms
        self.value = value
        
        self.isFavorited = false
    }
    
    static func loadOffersFromJson() -> [Offer] {
        var offers = [Offer]()
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                offers = try JSONDecoder().decode([Offer].self, from: data)
                
            } catch let error {
                print("json parse error: \(error)")
            }
        }
        
        return offers
    }
    
    func toggleFavorited() {
        isFavorited = !isFavorited
    }
    
}
