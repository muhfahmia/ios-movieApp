//
//  MovieParameter.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation

struct MovieListParameter: Encodable {
    var pathType: PathTypeMovie
    let page: Int
    
    enum PathTypeMovie: String {
        case trending = "trending/movie"
        case popular = "popular"
        case topRated = "top_rated"
        case upComing = "upcoming"
        case nowPlaying = "now_playing"
    }
    
    enum CodingKeys: String, CodingKey {
        case page
    }
    
    init(type: PathTypeMovie, page: Int) {
        self.pathType = type
        self.page = page
    }
}
