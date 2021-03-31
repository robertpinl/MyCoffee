//
//  Order.swift
//  MyCoffee
//
//  Created by Robert Pinl on 30.03.2021.
//

import Foundation

enum CoffeeType: String, Codable {
    case espresso
    case latte
    case cappuccino
    case mocha
    case americano
    case breve
}

enum CoffeeSize: String, Codable {
    case large
    case medium
    case small
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
