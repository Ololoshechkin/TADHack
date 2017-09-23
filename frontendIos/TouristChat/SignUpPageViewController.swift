//
//  SignUpPageViewController.swift
//  TouristChat
//
//  Created by Vadim on 23/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class SignUpPageViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!
    
    @IBOutlet weak var repeatPasswordLabel: UITextField!
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var secondNameLabel: UITextField!
    
    @IBOutlet weak var interestsTextBox: UITextView!
   
    @IBAction func signUp(_ sender: Any) {
        let showRegistrationAlert: (String) -> () =
        { self.showAlert(title: "Bad register data", message: $0) }
        if (loginLabel.text == "") {
            showRegistrationAlert("login field shouldn't be empty")
        } else if (passwordLabel.text == "") {
            showRegistrationAlert("password field shouldn't be empty")
        } else if (repeatPasswordLabel.text == "") {
            showRegistrationAlert("please, repeat password")
        } else if (repeatPasswordLabel.text != passwordLabel.text) {
            showRegistrationAlert("passwords differ")
        } else if (nameLabel.text == "") {
            showRegistrationAlert("enter your name")
        } else {
            ServerApi.signUp(
                login: loginLabel.text!,
                password: passwordLabel.text!,
                name: nameLabel.text!,
                secondName: secondNameLabel.text!,
                interests: interestsTextBox.text!,
                postAction: {
                    self.prevPage()?.showAlert(
                        title: "Congratulations",
                        message: "Registration ended up successfully!!!"
                    )}
            )
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
