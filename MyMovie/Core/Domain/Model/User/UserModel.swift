//
//  UserModel.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation

struct UserToken {
    var status: Bool = false
    var token: String = ""
    var expiredAt: String = ""
    var message: String = ""
}

struct UserProfile {
    var name: String = ""
    var username: String = ""
}


