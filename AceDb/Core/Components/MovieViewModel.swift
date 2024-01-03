//
//  MovieViewModel.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 29.12.2023.
//

import Foundation
import Alamofire

final class MovieViewModel: ObservableObject {
  @Published var returnedMovies: [Movie] = []

  func getMovies(searchTerm: String, page: String) {
    MovieManager.shared.searchMovies(searchTerm: searchTerm, includeAdult: "false", language: "en-US", page: page) { [weak self] result in
      guard let self = self else { return }

      switch result {
      case .success(let response):
        self.returnedMovies.removeAll()
        self.returnedMovies.append(response)
      case .failure(let failure):
        print("Error: \(failure.localizedDescription)")
      }
    }
  }
}
