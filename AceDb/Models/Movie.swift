//
//  Movie.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 29.12.2023.
//

import Foundation

struct Movie: Codable, Identifiable {
  var id: String { return UUID().uuidString }
  let results: [MovieResponse]?
  let totalPage: Int?


  var _results: [MovieResponse] {
    results ?? []
  }

  var _totalPage: Int {
    totalPage ?? 1
  }

  enum CodingKeys: String, CodingKey {
    case results
    case totalPage = "total_page"
  }
}

struct MovieResponse: Codable, Identifiable {
  var movieId: String { return UUID().uuidString }
  let backdropPath: String?
  let id: Int?
  let genreIds: [Int]?
  let originalTitle: String?
  let overview: String?
  let popularity: Double?
  let posterPath: String?
  let releaseDate: String?
  let voteAverage: Double?

  enum CodingKeys: String, CodingKey {
    case backdropPath = "backdrop_path"
    case id
    case genreIds = "genre_ids"
    case originalTitle = "original_title"
    case overview
    case popularity
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case voteAverage = "vote_average"
  }

  var _id: Int {
    id ?? Int.min
  }

  var _genreIds: [Int] {
    genreIds ?? []
  }

  var _originalTitle: String {
    originalTitle ?? "No title"
  }

  var _overview: String {
    overview ?? "No overview"
  }

  var _posterPath: String {
    posterPath ?? ""
  }

  var _releaseDate: String {
    releaseDate ?? "Unknown"
  }

  var _voteAverage: Double {
    voteAverage ?? 0.0
  }
}
