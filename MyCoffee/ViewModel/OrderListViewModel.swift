//
//  OrderListViewModel.swift
//  MyCoffee
//
//  Created by Robert Pinl on 31.03.2021.
//

import Foundation

struct OrderListViewModel {
    
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
}

extension OrderListViewModel {
    
    func orderViewModel(at index: Int) -> OrderViewModel {
        ordersViewModel[index]
    }
}
