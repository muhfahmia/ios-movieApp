//
//  AuthViewModel.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation

class AuthViewModel {
    
    private let authUseCase: AuthUseCase
    var userParam: UserParameter = .init()
    var message: String = ""
    
    
    init(authUseCase: AuthUseCase) {
        self.authUseCase = authUseCase
    }
    
    func submitAuth(completion: @escaping((Bool) -> Void)) {
        authUseCase.authUser(param: userParam) { [weak self] result in
            switch result {
            case .success(let userAuth):
                if userAuth.status == true {
                    completion(true)
                } else {
                    self?.message = userAuth.message
                    completion(false)
                }
            case .failure(let error):
                self?.message = error.localizedDescription
                completion(false)
            }
        }
    }
}
