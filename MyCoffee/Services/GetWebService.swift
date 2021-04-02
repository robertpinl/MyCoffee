//
//  GetWebService.swift
//  MyCoffee
//
//  Created by Robert Pinl on 30.03.2021.
//

import UIKit

class GetWebService {
    
    static let shared = GetWebService()
    
    func fetchOrders(completion: @escaping ([Order]) -> Void) {
        
        if let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error.debugDescription)   
                    return
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let orders = try decoder.decode([Order].self, from: safeData)
                        DispatchQueue.main.async {
                            completion(orders)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
