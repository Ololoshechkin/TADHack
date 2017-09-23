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
}
