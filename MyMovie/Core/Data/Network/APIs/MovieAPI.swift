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
    case list(param: MovieListParameter)
    case detail(param: MovieDetailParameter)
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
        case .list(let param):
            if param.pathType == .trending {
                return "trending/all/week"
            } else {
                return "movie/\(param.pathType.rawValue)"
            }
        case .detail(let param):
            return "movie/\(param.movieID)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUserToken:
            return .get
        case .authUser(_):
            return .post
        case .list(_):
            return .get
        case .detail(_):
            return .get
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
        case .list(let param):
            return param
        case .detail(let param):
            return param
        }
    }
}
