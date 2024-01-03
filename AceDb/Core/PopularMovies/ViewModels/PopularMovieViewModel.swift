//
//  PopularMovieViewModel.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 1.01.2024.
//

import Foundation

@MainActor
final class PopularMovieViewModel: ObservableObject {
  @Published var returnedPopularMovies: [Movie] = []
  let randomPageNumber = Int.random(in: 1...5)
  @Published var currentPage: Int
  @Published var totalPage: Int

  init() {
    currentPage = randomPageNumber
    totalPage = randomPageNumber + 10
  }

  func getPopularMovies() {
    MovieManager.shared.popularMovies(language: "en-US", page: "\(currentPage)") { [weak self] result in
      guard let self = self else { return }

      switch result {
      case .success(let response):
        self.returnedPopularMovies.append(response)
      case .failure(let failure):
        print("Error: \(failure.localizedDescription)")
      }
    }
  }
}
