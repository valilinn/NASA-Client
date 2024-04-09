//
//  DetailImageViewController.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import UIKit

class DetailImageViewController: UIViewController {
    
    private var detailImageView = DetailImageView()
    var imageString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailImageView
        view.backgroundColor = .systemBackground
        setButton()
        setupImage()
    }
    
    private func setButton() {
        detailImageView.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func closeButtonTapped() {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    func setupImage() {
            self.detailImageView.configure(image: self.imageString)
    }
}
