//
//  APIURLs.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 29.12.2023.
//

import Foundation

public enum APIURLs {
  static func baseURL() -> String {
    return "https://api.themoviedb.org/3"
  }

  static func apiKey() -> String {
    return "12623b9bb481d5291fee34a54d96720e"
  }

  static func imageUrl(posterPath: String) -> String {
    return "https://image.tmdb.org/t/p/w500\(posterPath)"
  }
}
