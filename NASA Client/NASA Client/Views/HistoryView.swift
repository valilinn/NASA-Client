//
//  HistoryView.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 10/04/2024.
//

import UIKit

class HistoryView: UIView {
    
    var tableView: UITableView!
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .backgroundOne
        setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        self.tableView = UITableView(frame: .zero)
        addSubview(tableView)
        
        tableView.register(HistoryViewCell.self, forCellReuseIdentifier: HistoryViewCell.reuseID)
        tableView.backgroundColor = .backgroundOne
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

