//
//  UserParameter.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation

struct UserParameter: Encodable {
    var username: String?
    var password: String?
    var token: String?

    enum CodingKeys: String, CodingKey {
        case username, password
        case token = "request_token"
    }
}
