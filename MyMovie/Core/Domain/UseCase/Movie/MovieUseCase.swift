//
//  MovieListUseCase.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation

protocol MovieUseCase {
    func list(param: MovieListParameter, completion: @escaping(Result<MoviesModel, Error>) -> Void)
    func detail(param: MovieDetailParameter, completion: @escaping(Result<MovieModel, Error>) -> Void)
}

struct MovieInteractor: MovieUseCase {
    
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func list(param: MovieListParameter, completion: @escaping (Result<MoviesModel, Error>) -> Void) {
        repository.list(param: param) { completion($0) }
    }
    
    func detail(param: MovieDetailParameter, completion: @escaping (Result<MovieModel, Error>) -> Void) {
        repository.detail(param: param) { completion($0) }
    }
    
}
