//
//  HomeAssembler.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 20/02/24.
//

import Foundation

protocol HomeAssembler {
    func resolve() -> HomeViewController
    func resolve() -> HomeViewModel
    func resolve() -> HomeRouter
    func resolve() -> MovieDataSource
    func resolve() -> MovieRepository
    func resolve() -> MovieUseCase
}

extension HomeAssembler where Self: Assembler {
    func resolve() -> HomeViewController {
        HomeViewController(vm: resolve(), route: resolve())
    }
    
    func resolve() -> HomeViewModel {
        HomeViewModel(movieUseCase: resolve())
    }
    
    func resolve() -> HomeRouter {
        DefaultHomeRouter(assembler: self)
    }
    
    func resolve() -> MovieDataSource {
        DefaultMovieDataSource()
    }
    
    func resolve() -> MovieRepository {
        DefaultMovieRepository(dataSource: resolve())
    }
    
    func resolve() -> MovieUseCase {
        MovieInteractor(repository: resolve())
    }
}
