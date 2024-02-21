//
//  APIFactory.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation
import Alamofire

protocol APIFactory {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var parameters: Encodable { get }
}
