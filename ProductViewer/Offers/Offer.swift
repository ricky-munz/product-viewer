//
//  Offer.swift
//  ProductViewer
//
//  Created by Richard S. Munz on 12/11/17.
//  Copyright © 2017 Richard S. Munz. All rights reserved.
//

import Foundation

class Offer {
    var id: Int
    var url: String
    var name: String
    var description: String
    var terms: String
    var currentValue: String
    var isFavorited: Bool
    
    init(id: Int, url: String, name: String, description: String, terms: String, currentValue: String) {
        self.id = id
        self.url = url
        self.name = name
        self.description = description
        self.terms = terms
        self.currentValue = currentValue
        
        self.isFavorited = false
    }
    
    func toggleFavorited() {
        isFavorited = !isFavorited
    }
}
