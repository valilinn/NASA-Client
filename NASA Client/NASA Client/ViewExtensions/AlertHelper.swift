//
//  AlertHelper.swift
//  NASA Client
//
//  Created by Валентина Лінчук on 10/04/2024.
//

import UIKit

struct AlertHelper {
    static func showSaveFilterAlert(in viewController: UIViewController, onSave: @escaping () -> Void) {
        let alert = UIAlertController(title: "Save Filters", message: "The current filters and the date you have chosen can be saved to the filter history.", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .cancel) { _ in
            onSave()
        }
        alert.addAction(saveAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true)
    }
    
    static func showUseFilterAlert(in viewController: UIViewController, onUse: @escaping () -> Void, onDelete: @escaping () -> Void) {
        let alert = UIAlertController(title: "Menu Filter", message: nil, preferredStyle: .actionSheet)
        
        let useAction = UIAlertAction(title: "Use", style: .default)  { _ in
            onUse()
        }
        alert.addAction(useAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive)  { _ in
            onDelete()
        }
        alert.addAction(deleteAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true)
    }
}
