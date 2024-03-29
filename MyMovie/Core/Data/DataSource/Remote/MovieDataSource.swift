//
//  MovieDataSource.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation

protocol MovieDataSource {
    func list(param: MovieListParameter, completion: @escaping(Result<MoviesModel, Error>) -> Void)
    func detail(param: MovieDetailParameter, completion: @escaping(Result<MovieModel, Error>) -> Void)
}

struct DefaultMovieDataSource: MovieDataSource {
    
    let network: NetworkService = NetworkService.shared
    
    func list(param: MovieListParameter, completion: @escaping (Result<MoviesModel, Error>) -> Void) {
        network.request(baseAPI: MovieAPI.list(param: param), responseType: MoviesModel.self) { completion($0) }
    }
    
    func detail(param: MovieDetailParameter, completion: @escaping (Result<MovieModel, Error>) -> Void) {
        network.request(baseAPI: MovieAPI.detail(param: param), responseType: MovieModel.self) { completion($0) }
    }
    
}
