//
//  MarsView.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import UIKit
import SnapKit

class MarsView: UIView {
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let navigationView = UIView()
    
    private let title = UILabel(text: "MARS.CAMERA", fontType: .largeTitle)
    private let dateLabel = UILabel(text: "June 6, 2019", fontType: .title2)
    
    private let calendarButton = UIButton()
    private let roverFilterButton = UIButton(title: "All", image: .roverAll)
    private let cameraFilterButton = UIButton(title: "All", image: .cameraAll)
    private let plusButton = UIButton(image: .plus)
    
    var tableViewHeightConstraint: Constraint?
    
    let tableView = MarsTableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundOne
        tableView.backgroundColor = .green
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        calendarButton.setImage(.calendar, for: .normal)
        calendarButton.layer.cornerRadius = 10
//        scrollView.backgroundColor = .blue
//        containerView.backgroundColor = .gray
        navigationView.backgroundColor = .accentOne
    }
    
    private func setConstraints() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints {
//            $0.top.equalTo(scrollView.snp.top)
            $0.top.equalTo(scrollView.snp.top).offset(-60)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.width.equalTo(scrollView)
        }
        
        containerView.addSubview(navigationView)
        navigationView.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.top)
            $0.leading.equalTo(containerView.snp.leading)
            $0.trailing.equalTo(containerView.snp.trailing)
            $0.height.equalTo(220)
        }
        
        navigationView.addSubview(title)
        title.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.top).offset(68)
            $0.leading.equalTo(navigationView.snp.leading).offset(16)
            $0.trailing.equalTo(navigationView.snp.trailing).offset(-16)
        }
        
        navigationView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(6)
            $0.leading.equalTo(title.snp.leading)
        }
        
        let stackButtons = UIStackView(arrangedSubviews: [roverFilterButton, cameraFilterButton])
        stackButtons.axis = .horizontal
        stackButtons.alignment = .fill
        stackButtons.distribution = .fillEqually // или .equalSpacing, в зависимости от предпочтений. Чтобы два элемента в стеке имели одинаковую ширину
        stackButtons.spacing = 15
        
        navigationView.addSubview(stackButtons)
        stackButtons.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(20)
            $0.leading.equalTo(dateLabel.snp.leading)
            $0.trailing.equalTo(navigationView.snp.trailing).offset(-70)
        }
        
        navigationView.addSubview(calendarButton)
        calendarButton.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(-16)
            $0.trailing.equalTo(navigationView.snp.trailing).offset(-14)
        }
        
        navigationView.addSubview(plusButton)
        plusButton.snp.makeConstraints {
            $0.centerY.equalTo(stackButtons.snp.centerY)
            $0.trailing.equalTo(navigationView.snp.trailing).offset(-16)
        }
        
        containerView.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(18)
            $0.leading.equalTo(containerView.snp.leading)
            $0.trailing.equalTo(containerView.snp.trailing)
            $0.bottom.equalTo(containerView.snp.bottom).offset(-16)
            tableViewHeightConstraint = $0.height.equalTo(1).constraint
        }
        
        
    }
    

}

//#Preview {
//    MarsViewController()
//}
