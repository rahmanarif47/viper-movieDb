//
//  GenreEntity.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 22/03/23.
//

import Foundation

struct genreRespone: Codable {
    var genres: [Genre]
}

struct Genre : Codable {
    var id: Int
    var name: String
}
