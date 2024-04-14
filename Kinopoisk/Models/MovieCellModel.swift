//
//  MovieCellModel.swift
//  Kinopoisk
//
//  Created by Алена on 14.04.2024.
//

import UIKit

struct MovieCellModel: Decodable, Equatable {
    let films: [MovieSearch]
}

struct MovieSearch: Decodable, Equatable {
    let filmId: Int?
    let nameRu: String?
    let nameEn: String?
    let posterUrl: String?
}
