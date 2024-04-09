//
//  ImagesViewController.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 09/04/2024.
//

import UIKit

class ImagesViewController: UIViewController, UIScrollViewDelegate {

    var images: [UIImage] = []
    
    private let imageView = UIImageView()
    private var scrollView: UIScrollView!
    private var pageControl: UIPageControl!
    
    private let closeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImages()
        setupScrollView()
        setupPageControl()
        setupButton()
    }
    
    private func getImages() {
        for i in 1...3 {
            if let image = UIImage(named: "marsImage") {
                images.append(image)
            }
        }
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
            //new
        scrollView.contentSize = CGSize(width: CGFloat(images.count) * view.bounds.width,
                                        height: view.bounds.height)
        scrollView.alwaysBounceVertical = false
        scrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(scrollView)
        
        for (index, image) in images.enumerated() {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(index) * view.bounds.width,
                                     y: 0,
                                     width: view.bounds.width,
                                     height: view.bounds.height)
            scrollView.addSubview(imageView)
        }
        
        scrollView.contentSize = CGSize(width: CGFloat(images.count) * view.bounds.width,
                                        height: view.bounds.height)
    }
    
    private func setupPageControl() {
        pageControl = UIPageControl()
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        view.addSubview(pageControl)
        
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
    private func setupButton() {
        closeButton.setImage(.whiteCloseButton , for: .normal)
        closeButton.tintColor = .backgroundOne
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.isEnabled = true
        closeButton.isUserInteractionEnabled = true
        
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(16)
        }
    }
    
    @objc
    func closeButtonTapped() {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.bounds.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    
    
}
