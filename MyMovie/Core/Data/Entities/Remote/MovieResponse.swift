//
//  MovieResponse.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation
import ObjectMapper

extension MoviesModel: Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        page    <- map["page"]
        movies  <- map["results"]
    }
    
}

extension MovieModel: Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        movieID         <- map["id"]
        title           <- map["title"]
        posterPath      <- map["poster_path"]
        backdropPath    <- map["backdrop_path"]
        adult           <- map["adult"]
        releaseDate     <- map["release_date"]
        description     <- map["overview"]
        duration        <- map["runtime"]
        rating          <- map["vote_average"]
    }
    
}
