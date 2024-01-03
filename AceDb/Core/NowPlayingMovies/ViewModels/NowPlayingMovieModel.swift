//
//  NowPlayingMovieModel.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 3.01.2024.
//

import Foundation

@MainActor
final class NowPlayingMovieModel: ObservableObject {
  @Published var returnedNowPlayingMovies: [Movie] = []
  let randomPageNumber = Int.random(in: 1...10)
  @Published var currentPage: Int
  @Published var totalPage: Int

  init() {
    currentPage = randomPageNumber
    totalPage = randomPageNumber + 10
  }

  func getNowPlayingMovies() {
    MovieManager.shared.nowPlayingMovies(language: "en-US", page: "\(currentPage)") { [weak self] result in
      guard let self = self else { return }

      switch result {
      case .success(let response):
        self.returnedNowPlayingMovies.append(response)
      case .failure(let failure):
        print("Error: \(failure.localizedDescription)")
      }
    }
  }
}
