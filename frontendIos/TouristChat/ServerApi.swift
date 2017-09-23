//
//  ServerApi.swift
//  TouristChat
//
//  Created by Vadim on 23/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit

class ServerApi {
    
    class User {
        
        enum Sex {
            case MALE
            case FEMALE
        }
        
        let token: String
        let name: String
        let secondName: String
        let age: Int
        let sex: Sex
        var interests: String
        var photo: UIImage?
        init(token: String, name: String, secondName: String, age: Int, sex: Sex, interests: String, photo: UIImage?) {
            self.token = token
            self.name = name
            self.secondName = secondName
            self.age = age
            self.sex = sex
            self.interests = interests
            self.photo = photo
        }
    }
    
    class func signIn(login: String, password: Int,
                      successAction: (User?) -> (),
                      insuccessAction: () -> ()) {
        if (TestFile.defaultUserServerData == (login, password)) {
            successAction(TestFile.defaultUser)
        } else {
            insuccessAction()
        }
    }
    
    class func signUp(login: String, password: String, name: String, secondName: String, interests: String, postAction: () -> ()){
        postAction()
    }
    
}
