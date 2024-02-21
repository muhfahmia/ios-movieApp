//
//  UserDataSource.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation
import UIKit

protocol UserDataSource {
    func getTokenFromSource(completion: @escaping (Result<UserToken, Error>) -> Void)
    func authUserFromSource(param: UserParameter, completion: @escaping(Result<UserToken, Error>) -> Void)
    func checkAuthUserFromSource(completion: @escaping(Bool) -> Void)
}

class DefaultUserDataSource: UserDataSource {
    
    let network: NetworkService = NetworkService.shared
    var userDefault = UserSession.shared
    
    func getTokenFromSource(completion: @escaping (Result<UserToken, Error>) -> Void) {
        network.request(baseAPI: MovieAPI.getUserToken, responseType: UserToken.self) { result in
            completion(result)
        }
    }
    
    func authUserFromSource(param: UserParameter, completion: @escaping (Result<UserToken, Error>) -> Void) {
        getTokenFromSource { result in
            switch result {
            case .success(let userToken):
        
                let paramNew: UserParameter = .init(username: param.username, password: param.password, token: userToken.token)
                
                self.network.request(baseAPI: MovieAPI.authUser(param: paramNew), responseType: UserToken.self) { resultAuth in
                    switch resultAuth {
                    case .success(let userAuth):
                        if userAuth.status {
                            self.userDefault.username = paramNew.username
                            self.userDefault.token = userAuth.token
                            self.userDefault.isLogin = true
                        }
                        completion(.success(userAuth))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func checkAuthUserFromSource(completion: @escaping (Bool) -> Void) {
//        self.userDefault.username = nil
//        self.userDefault.token = nil
//        self.userDefault.isLogin = false
//        print("userDefault: Login \(String(describing: self.userDefault.isLogin))")
//        print("userDefault: Token \(String(describing: self.userDefault.token))")
//        print("userDefault: Username \(String(describing: self.userDefault.username))")
        
        if self.userDefault.isLogin == true {
            completion(true)
        } else {
            completion(false)
        }
    }
}
