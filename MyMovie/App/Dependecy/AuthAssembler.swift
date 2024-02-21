//
//  AuthAssembler.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation
import UIKit

protocol AuthAssembler {
    func resolve() -> AuthViewController
    func resolve() -> AuthViewModel
    func resolve() -> AuthUseCase
    func resolve() -> UserRepository
    func resolve() -> UserDataSource
}

extension AuthAssembler where Self: Assembler {
    func resolve() -> AuthViewController {
        AuthViewController(vm: resolve())
    }
    
    func resolve() -> AuthViewModel {
        AuthViewModel(authUseCase: resolve())
    }
    
    func resolve() -> AuthUseCase {
        AuthInteractor(repository: resolve())
    }
    
    func resolve() -> UserRepository {
        DefaultUserRepository(dataSource: resolve())
    }
    
    func resolve() -> UserDataSource {
        DefaultUserDataSource()
    }
}
