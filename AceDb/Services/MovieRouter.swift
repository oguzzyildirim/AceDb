//
//  MovieRouter.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 29.12.2023.
//

import Alamofire
import Foundation

//https://api.themoviedb.org/3/search/movie?query=Harry%20Potter&include_adult=false&language=en-US&page=1&api_key=12623b9bb481d5291fee34a54d96720e

//https://www.googleapis.com/books/v1/volumes?langRestrict=\(language)&q=intitle:\(searchTerm.trimmed())&key=\(apiKey)

//https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=12623b9bb481d5291fee34a54d96720e

enum MovieRouter: URLRequestConvertible {
  case search(query: String, includeAdult: String, language: String, page: String, api_key: String)
  case popular(language: String, page: String, api_key: String)
  case nowPlaying(language: String, page: String, api_key: String)
  case upcoming(language: String, page: String, api_key: String)


  private var baseURL: URL {
    return URL(string: APIURLs.baseURL())!
  }

  private var api_key: String {
    return APIURLs.apiKey()
  }

  private var method: HTTPMethod {
    return .get
  }

  private var path: String {
    switch self {
    case .search:
      return "/search/movie"
    case .popular:
      return "/movie/popular"
    case .nowPlaying:
      return "/movie/now_playing"
    case .upcoming:
      return "/movie/upcoming"
    }


  }

  private var parameters: Parameters? {
    switch self {
    case .search(let query, let includeAdult, let language, let page, let api_key):
      return ["query": query,
              "include_adult": includeAdult,
              "language": language,
              "page": page,
              "api_key": api_key
      ]
    case .popular(let language, let page, let api_key):
      return ["language": language,
              "page": page,
              "api_key": api_key
      ]

    case .nowPlaying(let language, let page, let api_key):
      return ["language": language,
              "page": page,
              "api_key": api_key
      ]

    case .upcoming(let language, let page, let api_key):
      return ["language": language,
              "page": page,
              "api_key": api_key
      ]
    }
  }

  func asURLRequest() throws -> URLRequest {
    let url = baseURL.appendingPathComponent(path)

    var request = URLRequest(url: url)
    request.method = method
    return try URLEncoding.default.encode(request, with: parameters)
  }
}


struct CustomURLEncoding: ParameterEncoding {
  func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
    var request = try urlRequest.asURLRequest()

    if var urlComponents = URLComponents(url: request.url!, resolvingAgainstBaseURL: false), let parameters = parameters {
      urlComponents.queryItems = parameters.map { key, value in
        URLQueryItem(name: key, value: "\(value)")
      }
      request.url = urlComponents.url
    }

    return request
  }
}
