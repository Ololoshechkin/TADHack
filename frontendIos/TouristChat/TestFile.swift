//
//  TestFile.swift
//  TouristChat
//
//  Created by Vadim on 23/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation

class TestFile {
    
    static let defaultUserServerData = (login: "Ololoshechkin", passwordHash: "qwerty12345".hashValue)
    
    static let defaultUser = ServerApi.User(
        token: "Ololoshechkin",
        name: "Vadim",
        secondName: "Brilyantov",
        age: 19,
        sex: .MALE,
        interests: "",//sports programming, kotlin development, sports",
        photo: nil
    )
    
    static let searchResults = [ServerApi.User("josdas", "Stas", "Naumov", 18, "male", #imageLiteral(resourceName: "josdas")), ServerApi.User("K", "Ilya", "Kokorin", 19, "male", #imageLiteral(resourceName: "KokorinIlya")), ServerApi.User("kek3", "Andrey", "Zakharov", 18, "male", #imageLiteral(resourceName: "Zaharych")), ServerApi.User("kek4", "Andrey", "Geyen", 19, "female", #imageLiteral(resourceName: "Ololoshechkin")), ServerApi.User("kek6", "Yuri", "Bondarchuk", 19, "male", #imageLiteral(resourceName: "Yura")),
     ServerApi.User("kek6", "Lev", "Dogzick", 19, "male", #imageLiteral(resourceName: "Lev"))]
}
