//
//  HistoryView.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 10/04/2024.
//

import UIKit
import SnapKit

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
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide.snp.edges)
        }
    }
}

