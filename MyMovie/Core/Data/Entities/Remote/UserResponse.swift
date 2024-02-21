//
//  UserResponse.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation
import ObjectMapper

extension UserToken: Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        status      <- map["success"]
        expiredAt   <- map["expires_at"]
        token       <- map["request_token"]
        message     <- map["status_message"]
    }
    
}
