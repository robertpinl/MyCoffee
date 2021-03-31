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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addOrder))
        
        tableView.register(OrderTableViewCell.self, forCellReuseIdentifier: "orderCell")
        tableView.rowHeight = 80
        
        fetchOrders()
    }
    
    @objc private func addOrder() {
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
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
     }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
