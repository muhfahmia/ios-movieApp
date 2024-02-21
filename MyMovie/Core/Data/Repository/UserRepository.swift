//
//  UserRepository.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation

protocol UserRepository {
    func authUser(param: UserParameter, completion: @escaping(Result<UserToken, Error>) -> Void)
    func checkAuthUser(completion: @escaping(Bool) -> Void)
}

struct DefaultUserRepository: UserRepository {
    
    private let dataSource: UserDataSource
    
    init(dataSource: UserDataSource) {
        self.dataSource = dataSource
    }
    
    func authUser(param: UserParameter, completion: @escaping (Result<UserToken, Error>) -> Void) {
        dataSource.authUserFromSource(param: param) { completion($0) }
    }
    
    func checkAuthUser(completion: @escaping(Bool) -> Void) {
        dataSource.checkAuthUserFromSource { completion($0) }
    }
}
