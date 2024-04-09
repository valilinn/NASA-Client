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
//        tableView.backgroundColor = .white
//        tableView.backgroundColor = .cyan
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
       
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide.snp.edges)
        }
    }
    
}

