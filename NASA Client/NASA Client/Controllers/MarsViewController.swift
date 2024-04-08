//
//  MarsViewController.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import UIKit
import SnapKit

class MarsViewController: UIViewController {

//    let toSecondVC = UIButton()
    private let marsView = MarsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundOne
        view = marsView
//        toSecondVC.setImage(UIImage(systemName: "xmark"), for: .normal)
//        toSecondVC.addTarget(self, action: #selector(toSecondVCTapped), for: .touchUpInside)
//        view.addSubview(toSecondVC)
//        toSecondVC.snp.makeConstraints {
//            $0.centerX.equalTo(view.snp.centerX)
//            $0.centerY.equalTo(view.snp.centerY)
//        }

//        checkFonts()
        
        setupViews()
    }
//    
//    @objc
//    private func toSecondVCTapped() {
//        navigationController?.pushViewController(HistoryViewController(), animated: true)
//    }
    
    //to check custom fonts family
    private func checkFonts() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    private func setupViews() {
//        createCustomNavigationBar()
//        
//        let customTitleView = createCustomTitleView(title: "MARS.CAMERA", description: "June 6, 2019")
//        navigationItem.titleView = customTitleView
//        
//        let calendarButton = createCustomButton(imageName: .calendar, selector: #selector(calendarButtonTapped))
        
    }
    
//    @objc
//    private func calendarButtonTapped() {
//        print("calendarButtonTapped")
//    }

    

}
