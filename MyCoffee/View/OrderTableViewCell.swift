//
//  OrderTableViewCell.swift
//  MyCoffee
//
//  Created by Robert Pinl on 31.03.2021.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    let type = UILabel()
    let size = UILabel()
    let name = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        configureTypeLabel()
        configureDetailLabel()
        configureSizeLabel()
    }
    
    private func configureTypeLabel() {
        contentView.addSubview(type)
        type.translatesAutoresizingMaskIntoConstraints = false
        
        type.font = UIFont.systemFont(ofSize: 22, weight: .light)
        
        NSLayoutConstraint.activate([
            type.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            type.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -15),
            
        ])
    }
    
    private func configureDetailLabel() {
        contentView.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false

        name.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        name.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
    }
    
    private func configureSizeLabel() {
        contentView.addSubview(size)
        size.translatesAutoresizingMaskIntoConstraints = false
        
        size.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        
        NSLayoutConstraint.activate([
            size.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            size.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
