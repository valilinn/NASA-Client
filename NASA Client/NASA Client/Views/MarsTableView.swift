//
//  MarsTableView.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import Foundation
import SnapKit

class MarsTableView: UIView {
    
    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView = UITableView()
        addSubview(tableView)
        tableView.register(InfoViewCell.self, forCellReuseIdentifier: InfoViewCell.reuseID)
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
       
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

