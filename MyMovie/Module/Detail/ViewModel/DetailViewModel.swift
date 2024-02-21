//
//  DetailViewModel.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation

class DetailViewModel {
    
    var movie: MovieModel = .init()
    var movieParam: MovieDetailParameter = .init(id: "")
    private let movieUseCase: MovieUseCase
    
    init(movieUseCase: MovieUseCase) {
        self.movieUseCase = movieUseCase
    }
    
    func getMovieDetail(param: MovieDetailParameter, completion: @escaping(MovieModel) -> Void) {
        movieUseCase.detail(param: param) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movie):
                self.movie = movie
                completion(self.movie)
            case .failure(let error):
                print("getMovie: \(error)")
            }
        }
    }
    
}
