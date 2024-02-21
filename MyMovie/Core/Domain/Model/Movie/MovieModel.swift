//
//  Movie.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation

struct MovieModel {
    var ranking: Int = 0
    var movieID: Int = 0
    var title: String = ""
    var posterPath: String = ""
    var backdropPath: String = ""
    var releaseDate: String = ""
    var description: String = ""
    var adult: Bool = false
    var duration: Int = 0
    var country: String = ""
    var productionHouse: String = ""
    var rating: Double = 0.0
}


struct MoviesModel {
    var page: Int = 0
    var movies: [MovieModel] = []
}
