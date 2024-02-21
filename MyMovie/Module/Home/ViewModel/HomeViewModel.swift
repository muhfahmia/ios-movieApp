//
//  HomeViewModel.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation

class HomeViewModel {
    
    var movieTrendingParam: MovieListParameter = .init(type: .trending, page: 1)
    var movieNowPlayingParam: MovieListParameter = .init(type: .nowPlaying, page: 1)
    var movieTrending: [MovieModel] = []
    var movieNowPlaying: [MovieModel] = []
    private let movieUseCase: MovieUseCase
    
    init(movieUseCase: MovieUseCase) {
        self.movieUseCase = movieUseCase
    }
    
    func getMovieList(param: MovieListParameter, completion: @escaping([MovieModel]) -> Void) {
        movieUseCase.list(param: param) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let moviesModel):
                self.movieTrending = moviesModel.movies
                completion(self.movieTrending)
            case .failure(let error):
                print("getListMovieError: \(error)")
            }
        }
    }
    
}
