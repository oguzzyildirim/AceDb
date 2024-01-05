//
//  MovieManager.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 29.12.2023.
//

import Foundation
import Alamofire

final class MovieManager: ObservableObject {
  static let shared = MovieManager()
  private init(){}

  func searchMovies(searchTerm: String, includeAdult: String, language: String, page: String, completion: @escaping (Result<Movie, AFError>) -> Void) {
    AF.request(MovieRouter.search(query: searchTerm.trimmed(), includeAdult: includeAdult, language: language, page: page, api_key: APIURLs.apiKey()))
      .validate()
      .responseDecodable(of: Movie.self, completionHandler: { (response: DataResponse<Movie, AFError>) in
        completion(response.result)
      })
  }

  func popularMovies(language: String, page: String, completion: @escaping (Result<Movie, AFError>) -> Void) {
    AF.request(MovieRouter.popular(language: language, page: page, api_key: APIURLs.apiKey()))
      .validate()
      .responseDecodable(of: Movie.self, completionHandler: { (response: DataResponse<Movie, AFError>) in
        completion(response.result)
      })
  }

  func nowPlayingMovies(language: String, page: String, completion: @escaping (Result<Movie, AFError>) -> Void) {
    AF.request(MovieRouter.nowPlaying(language: language, page: page, api_key: APIURLs.apiKey()))
      .validate()
      .responseDecodable(of: Movie.self, completionHandler: { (response: DataResponse<Movie, AFError>) in
        completion(response.result)
      })
  }

  func upcomingMovies(language: String, page: String, completion: @escaping (Result<Movie, AFError>) -> Void) {
    AF.request(MovieRouter.upcoming(language: language, page: page, api_key: APIURLs.apiKey()))
      .validate()
      .responseDecodable(of: Movie.self, completionHandler: { (response: DataResponse<Movie, AFError>) in
        completion(response.result)
      })
  }

  func similarMovies(movieId: Int, language: String, page: String, completion: @escaping (Result<Movie, AFError>) -> Void) {
    AF.request(MovieRouter.similar(movieId: movieId, language: language, page: page, api_key: APIURLs.apiKey()))
      .validate()
      .responseDecodable(of: Movie.self) { (response: DataResponse<Movie, AFError>) in
        completion(response.result)
      }
  }
}
