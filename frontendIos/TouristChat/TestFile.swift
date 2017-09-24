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
        interests: "sports programming, kotlin development, sports",
        photo: nil
    )
    
    static let searchResults = [ServerApi.UserSmall("kek", "Stas", "Naumov", 18, "male", nil), ServerApi.UserSmall("kek2", "Ilya", "Kokorin", 19, "male", nil), ServerApi.UserSmall("kek3", "Andrey", "Zakharov", 18, "male", nil), ServerApi.UserSmall("kek4", "Viktoria", "Erokhina", 19, "female", nil), ServerApi.UserSmall("kek6", "Yuri", "Bondarchuk", 19, "male", nil)]
}
