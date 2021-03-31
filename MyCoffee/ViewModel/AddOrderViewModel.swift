//
//  AddOrderViewModel.swift
//  MyCoffee
//
//  Created by Robert Pinl on 31.03.2021.
//

import Foundation

struct AddOrderViewModel {
    
    var name: String?
    var email: String?
    
    var types: [String] {
        return CoffeeType.allCases.map({ $0.rawValue.capitalized })
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map({ $0.rawValue.capitalized })
    }
}
