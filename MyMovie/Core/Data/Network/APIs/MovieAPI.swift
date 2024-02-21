//
//  MovieAPI.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation
import Alamofire

enum MovieAPI {
    case getUserToken
    case authUser(param: UserParameter)
}

extension MovieAPI: APIFactory {

    var baseURL: URL {
        URL(string: Constants.baseUrlMovieAPI)!
    }
    
    var path: String {
        switch self {
        case .getUserToken:
            return "authentication/token/new"
        case .authUser(_):
            return "authentication/token/validate_with_login"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUserToken:
            return .get
        case .authUser(_):
            return .post
        }
    }
    
    var headers: HTTPHeaders {
        ["Authorization": "Bearer \(Constants.accessToken)"]
    }
    
    var parameters: Encodable {
        switch self {
        case .getUserToken:
            return ["api_key": Constants.apiKey]
        case .authUser(let param):
            return param
        }
    }
}
