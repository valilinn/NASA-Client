//
//  MarsView.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import UIKit

class MarsView: UIView {
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let navigationView = UIView()
    
    private let title = UILabel()
    var dateLabel = UILabel()
    let calendarButton = UIButton()
    let roverFilterButton = UIButton(title: "All", image: .roverAll)
    let cameraFilterButton = UIButton(title: "All", image: .cameraAll)
    let plusButton = UIButton(image: .plus)
    
    let marsEmptyView = MarsEmptyView()
    let tableView = MarsTableView()
   
    var tableViewHeightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundOne
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        title.text = "MARS.CAMERA"
        title.font = CustomFont.largeTitle
        dateLabel.text = "June 6, 2019"
        dateLabel.font = CustomFont.title2
        
        calendarButton.setImage(.calendar, for: .normal)
        calendarButton.layer.cornerRadius = 10
        roverFilterButton.isUserInteractionEnabled = true
        cameraFilterButton.isUserInteractionEnabled = true
        plusButton.isUserInteractionEnabled = true

        navigationView.backgroundColor = .accentOne
    }
    
    private func setConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -60),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(navigationView)
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: containerView.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        title.translatesAutoresizingMaskIntoConstraints = false
        navigationView.addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: 68),
            title.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor, constant: -16)
        ])
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        navigationView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 6),
            dateLabel.leadingAnchor.constraint(equalTo: title.leadingAnchor)
        ])
        
        let stackButtons = UIStackView(arrangedSubviews: [roverFilterButton, cameraFilterButton])
        stackButtons.translatesAutoresizingMaskIntoConstraints = false
        stackButtons.axis = .horizontal
        stackButtons.alignment = .fill
        stackButtons.distribution = .fillEqually
        stackButtons.spacing = 15
        
        navigationView.addSubview(stackButtons)
        NSLayoutConstraint.activate([
            stackButtons.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            stackButtons.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            stackButtons.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor, constant: -70)
        ])
        
        calendarButton.translatesAutoresizingMaskIntoConstraints = false
        navigationView.addSubview(calendarButton)
        NSLayoutConstraint.activate([
            calendarButton.topAnchor.constraint(equalTo: title.bottomAnchor, constant: -16),
            calendarButton.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor, constant: -14)
        ])
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        navigationView.addSubview(plusButton)
        NSLayoutConstraint.activate([
            plusButton.centerYAnchor.constraint(equalTo: stackButtons.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor, constant: -16),
            plusButton.widthAnchor.constraint(equalToConstant: 38)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(tableView)
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 1)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 18),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            tableViewHeightConstraint!
        ])
        
        marsEmptyView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(marsEmptyView)
        NSLayoutConstraint.activate([
            marsEmptyView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 250),
            marsEmptyView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    }
}

