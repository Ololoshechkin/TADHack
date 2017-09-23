//
//  ProfileOrSearchTabBarController.swift
//  TouristChat
//
//  Created by Vadim on 23/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class ProfileOrSearchTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var user: ServerApi.User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        print("user name : \(user!.name)\n")
        (self.viewControllers![0] as! ProfileViewController).user = user
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}
