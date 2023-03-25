//
//  ListMovieEntity.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 25/03/23.
//

import Foundation

//MARK: - Need to fix and sync by json data.
struct MovieList : Codable {
    var results: [ResultMovieList]
}

struct ResultMovieList : Codable {
    var id : String
    var originalTitle: String
    var title: String
    var posterPath: String
    var voteAverage: Double
    var overview: String
}
