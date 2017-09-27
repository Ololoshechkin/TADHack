//
//  UserInfoViewController.swift
//  TouristChat
//
//  Created by Vadim on 24/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class UserInfoViewController: UIViewController {
    
    var user: ServerApi.User? = nil
    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var sex: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var interests: UILabel!
    
    
    @IBAction func openChat(_ sender: Any) {
        nextPage(id: "Chat")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = user!.name + " " + user!.secondName
        age.text = "\(user!.age) years old"
        sex.text = "\(user!.sex)".lowercased()
        interests.text = "(no interests found)"
        photo.image = (user!.photo ?? #imageLiteral(resourceName: "parisImage"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
