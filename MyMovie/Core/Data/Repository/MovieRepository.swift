//
//  MovieRepository.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation

protocol MovieRepository {
    func list(param: MovieListParameter, completion: @escaping(Result<MoviesModel, Error>) -> Void)
    func detail(param: MovieDetailParameter, completion: @escaping(Result<MovieModel, Error>) -> Void)
}

struct DefaultMovieRepository: MovieRepository {
    
    private let dataSource: MovieDataSource
    
    init(dataSource: MovieDataSource) {
        self.dataSource = dataSource
    }
    
    func list(param: MovieListParameter, completion: @escaping (Result<MoviesModel, Error>) -> Void)  {
        dataSource.list(param: param) { completion($0) }
    }
    
    func detail(param: MovieDetailParameter, completion: @escaping (Result<MovieModel, Error>) -> Void) {
        dataSource.detail(param: param) { completion($0) }
    }
    
}
