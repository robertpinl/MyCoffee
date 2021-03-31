//
//  OrderViewModel.swift
//  MyCoffee
//
//  Created by Robert Pinl on 31.03.2021.
//

import Foundation

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    
    var name: String {
        return self.order.name
    }
    
    var email: String {
        return self.order.email
    }
    
    var type: String {
        return self.order.type.rawValue.capitalized
    }
    
    var size: String {
        return self.order.size.rawValue.capitalized
    }
}
