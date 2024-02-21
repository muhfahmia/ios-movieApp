//
//  MovieDetailParameter.swift
//  MyMovie
//
//  Created by Muh Fahmi Ardiyanto on 21/02/24.
//

import Foundation

struct MovieDetailParameter: Encodable {
    
    var movieID: String = ""
    
    init(id: String) {
        movieID = id
    }
}
