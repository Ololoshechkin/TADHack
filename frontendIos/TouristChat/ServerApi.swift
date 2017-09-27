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
        init(_ token: String = "", _ name: String, _ secondName: String, _ age: Int, _ sex: String, _ photo: UIImage?) {
            self.token = token
            self.name = name
            self.secondName = secondName
            self.age = age
            self.sex = (sex == "male" ? Sex.MALE : Sex.FEMALE)
            self.photo = photo
            self.interests = "(no interests found)"
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
    
    class func signUp(login: String, password: Int, name: String, secondName: String, interests: String, sex: String, age: Int, postAction: @escaping () -> ()) {
        let url = "http://172.20.10.3:5000/new_user/{\"login\": \"\(login)\", \"password\": \"\(password)\", \"user\": {\"name\": \"\(name) \(secondName)\", \"sex\": \"\(sex.characters.first!)\", \"age\": \(age), \"login\": \"\(login)\", \"person_info\": {}}}"
        print(url)
        URLSession.shared.dataTask(with: URL(string: url)!) {
            (data, response, error) in
            print("\nresponce = \(response)\n")
            print("data = \(data)\n")
            print("error = \(error)\n")
            postAction()
        }.resume()
        postAction()
    }
    
    class func searchRequest(map: [String: Any]) -> [User] {
        return TestFile.searchResults
    }
    
    class func addMyMessages(messages: [String]) {
        
    }
    
    static var messageIndex = 0
    private static let preMessages = ["Yes!We have so much in common!", "Where do you like to go?", "Let's meet at the monument nearby."]
    
    class func getHisMessages(postAction: @escaping ([String]) -> Void) {
        let msgs = [preMessages[messageIndex]]
        messageIndex += 1
        messageIndex %= preMessages.count
        postAction(msgs)
    }
    
}
