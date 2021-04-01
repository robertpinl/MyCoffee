//
//  OrdersTableViewController.swift
//  MyCoffee
//
//  Created by Robert Pinl on 29.03.2021.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel()
    let addOrderViewController = AddOrderViewController()
    
    override func loadView() {
        super.loadView()
        
        navigationItem.title = "Orders"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addOrder))
        
        tableView.register(OrderTableViewCell.self, forCellReuseIdentifier: "orderCell")
        tableView.rowHeight = 75
        
        fetchOrders()
    }
    
    @objc private func addOrder() {
        addOrderViewController.delegate = self
        self.navigationController?.pushViewController(addOrderViewController, animated: true)
    }
    
    private func fetchOrders() {
        WebService.shared.fetchOrders { [weak self] (orders) in
            self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableViewCell
        let orders = orderListViewModel.orderViewModel(at: indexPath.row)
        cell.type.text = orders.type
        cell.name.text = orders.name
        cell.size.text = orders.size
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension OrdersTableViewController: AddCoffeeDelegate {
    func didAddCoffeeOrder(order: Order) {
        self.orderListViewModel.ordersViewModel.append(OrderViewModel(order: order))
        self.tableView.reloadData()
    }
    
    
}
