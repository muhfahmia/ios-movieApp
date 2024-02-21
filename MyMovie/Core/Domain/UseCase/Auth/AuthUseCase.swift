//
//  UserUseCase.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation

protocol AuthUseCase {
    func authUser(param: UserParameter, completion: @escaping(Result<UserToken, Error>) -> Void)
    func checkAuthUser(completion: @escaping(Bool) -> Void)
}

struct AuthInteractor: AuthUseCase {
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func authUser(param: UserParameter, completion: @escaping (Result<UserToken, Error>) -> Void) {
        repository.authUser(param: param) { completion($0) }
    }
    
    func checkAuthUser(completion: @escaping(Bool) -> Void) {
        repository.checkAuthUser { completion($0) }
    }
    
}

