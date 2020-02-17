//
//  Models.swift
//  RemotelyCoffee
//
//  Created by Stephanie on 2/16/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import Foundation

//Yelp API JSON
struct Root: Codable {
    let businesses: [Business]
}

struct Business: Codable {
    let id: String
    let name: String
    let imageUrl: URL
    let distance: Double
}

struct CoffeeShopListViewModel {
    let name: String
    let imageUrl: URL
    let distance: String
    let id: String
}


extension CoffeeShopListViewModel {
    init(business: Business) {
        self.name = business.name
        self.id = business.id
        self.imageUrl = business.imageUrl
        self.distance = "\(business.distance)"
    }
}
