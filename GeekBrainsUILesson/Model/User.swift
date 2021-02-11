//
//  User.swift
//  GeekBrainsUILesson
//
//  Created by Андрей Ситников on 27.01.2021.
//

import Foundation

struct User {
    let userName : String
    let userPhoto : String
    let letter : Character
    
    init(userName: String, userPhoto: String) {
        self.userName = userName
        self.userPhoto = userPhoto
        self.letter = self.userName[userName.startIndex]
    }
}
