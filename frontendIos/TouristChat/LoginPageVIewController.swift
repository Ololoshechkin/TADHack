//
//  LoginPageVIewController.swift
//  TouristChat
//
//  Created by Vadim on 23/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class LoginPageVIewController: UIViewController {
    
    @IBAction func signUp(_ sender: Any) {
        nextPage(id: "SignUp")
    }
    
    @IBAction func signIn(_ sender: Any) {
        nextPage(id: "SignIn")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
