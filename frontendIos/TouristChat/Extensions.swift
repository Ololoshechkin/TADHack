//
//  Extensions.swift
//  TouristChat
//
//  Created by Vadim on 23/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: NSLocalizedString(title, comment:""),
            message: NSLocalizedString(message, comment:""),
            preferredStyle: .alert
        )
        let defaultAction = UIAlertAction(
            title: NSLocalizedString("Ok", comment: ""),
            style: .default, handler: { (pAlert) in }
        )
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func nextPage(id: String, preAction: (UIViewController) -> () = {_ in }) {
        let nextViewController = (storyboard?.instantiateViewController(withIdentifier: id))!
        preAction(nextViewController)
        self.navigationController?.pushViewController(
            nextViewController,
            animated: true
        )
    }
    
    func prevPage() -> UIViewController? {
        self.navigationController?.popViewController(animated: true)
        return self.navigationController?.topViewController
    }
}
