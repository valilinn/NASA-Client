//
//  ViewController.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 08/04/2024.
//

import UIKit

class PreloaderViewController: UIViewController {
    
    private let preloaderView = PreloaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = preloaderView
        
    }


}

