//
//  AddOrderViewController.swift
//  MyCoffee
//
//  Created by Robert Pinl on 29.03.2021.
//

import UIKit

class AddOrderViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()
    let segmentedControl = UISegmentedControl(items: ["Small", "Medium", "Large"])
    let nameTextField = UITextField()
    let emailTextField = UITextField()
    var safeArea: UILayoutGuide!
    
    var coffeType = [CoffeeType]()
    
    let addOrderViewModel = AddOrderViewModel()
    
    
    override func loadView() {
        super.loadView()
        
        navigationItem.title = "Add New Order"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        safeArea = view.layoutMarginsGuide
        
        configureTableView()
        configureSegmentedControl()
        configureNameTextField()
        configureEmailTextField()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @objc private func save() {
        print("Saved!")
    }
    

    private func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func configureSegmentedControl() {
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 25),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
    }
    
    private func configureNameTextField() {
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.borderStyle = .roundedRect
        nameTextField.placeholder = "Name"
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
        ])
    }
    
    private func configureEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.borderStyle = .roundedRect
        emailTextField.placeholder = "Email"
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.trailingAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor)
            
        ])
    }
}

//MARK: - TableView Data Source
extension AddOrderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoffeeType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = addOrderViewModel.types[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
