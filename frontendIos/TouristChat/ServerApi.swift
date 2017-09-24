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
    
    class UserSmall {
        let token: String
        let name: String
        let secondName: String
        let age: Int
        let sex: String
        let photo: UIImage?
        init(_ token: String = "", _ name: String, _ secondName: String, _ age: Int, _ sex: String, _ photo: UIImage?) {
            self.token = token
            self.name = name
            self.secondName = secondName
            self.age = age
            self.sex = sex
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
    
    class func signUp(login: String, password: Int, name: String, secondName: String, interests: String, sex: String, age: Int, postAction: @escaping () -> ()){
        var url : NSString = "http://127.0.0.1:5000/new_user/{\"login\": \"\(login)\", \"password\": \"\(password)\", \"user\": {\"name\": \"\(name) \(secondName)\", \"sex\": \"\(sex.characters.first!)\", \"age\": \"\(age)\", \"login\": \"\(login)\", \"person_info\": {}}}" as NSString
        var urlStr : NSString = url.addingPercentEscapes(using: String.Encoding.utf8.rawValue)! as NSString
        var searchURL : NSURL = NSURL(string: urlStr as String as String)!
        print(searchURL)
        let task = URLSession.shared.dataTask(with: searchURL as URL) {(data, response, error) in
            print("\nresponce = \(response)\n")
            postAction()
        }
    }
    
    class func searchRequest(map: [String: Any]) -> [UserSmall] {
        return TestFile.searchResults
    }
    
}
