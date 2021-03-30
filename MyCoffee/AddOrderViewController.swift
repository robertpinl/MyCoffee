//
//  AddOrderViewController.swift
//  MyCoffee
//
//  Created by Robert P on 29.03.2021.
//

import UIKit

class AddOrderViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()
    let segmentedControl = UISegmentedControl(items: ["Small", "Medium", "Large"])
    var safeArea: UILayoutGuide!
    
    var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
    
    override func loadView() {
        super.loadView()
        
        navigationItem.title = "Add New Order"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        safeArea = view.layoutMarginsGuide
        
        configureTableView()
        configureSegmentedControl()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.topAnchor, constant: 200),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    func configureSegmentedControl() {
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 25),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        ])
    }
}

extension AddOrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = characters[indexPath.row]
        return cell
    }
}
