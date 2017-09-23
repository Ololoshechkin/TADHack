//
//  SignInPageViewController.swift
//  TouristChat
//
//  Created by Vadim on 23/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class SignInPageViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UITextField!
    
    @IBOutlet weak var passwordLabel: UITextField!
    
    func signIn(login: String, password: Int) {
        ServerApi.signIn(
            login: login,
            password: password,
            successAction: { user in
                UserDefaults.standard.set([login, password], forKey: "latest account")
                UserDefaults.standard.synchronize()
                self.nextPage(
                id: "ProfileOrSearchPage",
                preAction: { controller in
                    (controller as! ProfileOrSearchTabBarController).user = user
                })
            },
            insuccessAction: { self.showAlert(title: "Try again!", message: "no such user found in database") }
        )
    }
    
    @IBAction func signInPress(_ sender: Any) {
        signIn(login: loginLabel.text ?? "", password: (passwordLabel.text ?? "").hashValue)
    }
    
    @IBAction func signInToLastAccount(_ sender: Any) {
        let data = UserDefaults.standard.value(forKey:
            "latest account") as! Array<Any>?
        if (data != nil) {
            signIn(login: data![0] as! String, password: data![1] as! Int)
        } else {
            showAlert(title: "Error", message: "Never signed in yet")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
