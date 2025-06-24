//
//  Endpoint.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 22/03/23.
//

import Foundation

enum Endpoint {
    case getGenre
    case getListMovieByGenre(Int, Int)
    
    var apiKey: String {
        return "1bd26642c99c1239e10c9d2b44182639"
    }

    var baseUrl: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var baseImageUrl: String {
        return "https://image.tmdb.org/t/p/w500/"
    }

    var url: URL {
        switch self {
        case .getGenre :
            return URL(string: baseUrl+"/genre/movie/list?api_key=\(apiKey)&language=en-US")!
        case .getListMovieByGenre(let genreId, let page):
            return URL(string: baseUrl+"discover/movie?api_key=\(apiKey)&with_genres=\(genreId)&page=\(page)")!
        }
    }
}
