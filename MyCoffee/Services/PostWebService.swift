//
//  PostWebService.swift
//  MyCoffee
//
//  Created by Robert P on 31.03.2021.
//

import UIKit

class PostWebService {
    
    func sendOrder(order: Order) {
        
        if let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") {
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try? encoder.encode(order)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    print(error.debugDescription)
                    return
                }
            }
            .resume()
        }
    }
}
