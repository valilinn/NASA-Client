//
//  MarsViewController_Extension.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

//import UIKit
//
//extension UIViewController {
//    
//    func createCustomNavigationBar() {
//        
//        //to check this color
//        navigationController?.navigationBar.barTintColor = .backgroundOne
//        //        navigationController?.additionalSafeAreaInsets.top = -60
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.backgroundColor = .accentOne
//    
//        //can add more methods here abt nav
//    }
//    
//    //    func createCustomTitleView(title: String,
//    //                               description: String,
//    //                               calendarButton: UIButton,
//    //                               filterRovers: UIButton,
//    //                               filterCameras: UIButton,
//    //                               saveFilters: UIButton) -> UIView {
//    
//    func createCustomTitleView(title: String,
//                               description: String) -> UIView {
//        
//        let view = UIView()
//        view.backgroundColor = .blue
//        
//        let titleLabel = UILabel(text: title, fontType: .largeTitle)
//        view.addSubview(titleLabel)
//        titleLabel.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(16)
//            $0.top.equalTo(view.snp.top).offset(16)
//            $0.trailing.equalToSuperview().offset(-16)
//        }
//        
//        let descriptionLabel = UILabel(text: description, fontType: .title2)
//        view.addSubview(descriptionLabel)
//        descriptionLabel.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(16)
//            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
//            $0.trailing.equalToSuperview().offset(-16)
//        }
//        
//        //doesnt work
//        view.snp.makeConstraints {
//            $0.height.equalTo(300)
//            $0.width.equalTo(UIScreen.main.bounds.size.width)
//        }
//        
//        return view
//    }
//    
//    func createCustomButton(imageName: UIImage, selector: Selector) -> UIButton {
//        
//        let button = UIButton()
//        button.setImage(imageName, for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
//        button.addTarget(self, action: selector, for: .touchUpInside)
//        
//        return button
//    }
//    
//}
