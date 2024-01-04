//
//  UpcomingMoviesViewModel.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 3.01.2024.
//

import Foundation

@MainActor
final class UpcomingMoviesViewModel: ObservableObject {
  @Published var returnedUpcomingMovies: [Movie] = []
  let randomPageNumber = Int.random(in: 1...10)
  @Published var currentPage: Int
  @Published var totalPage: Int

  init() {
    currentPage = randomPageNumber
    totalPage = randomPageNumber + 5
  }

  func getUpcomingMovies() {
    MovieManager.shared.upcomingMovies(language: "en-US", page: "\(currentPage)") { [weak self] result in
      guard let self = self else { return }

      switch result {
      case .success(let response):
        self.returnedUpcomingMovies.append(response)
      case .failure(let failure):
        print("Error: \(failure.localizedDescription)")
      }
    }
  }
}
