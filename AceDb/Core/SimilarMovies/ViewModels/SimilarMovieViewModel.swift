//
//  SimilarMovieViewModel.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 4.01.2024.
//

import Foundation
import Kingfisher
@MainActor
final class SimilarMovieViewModel: ObservableObject {
  @Published var returnedSimilarMovies: [Movie] = []
  @Published var imageArray: [KFImage] = []

  func getSimilarMovies(movieId: Int) {
    MovieManager.shared.similarMovies(movieId: movieId, language: "en-US", page: "1") { [weak self] result in
      guard let self = self else { return }

      switch result {
      case .success(let response):

        self.returnedSimilarMovies.append(response)

        for movie in self.returnedSimilarMovies {
          for results in movie._results {
            imageArray.append(KFImage(URL(string: APIURLs.imageUrl(posterPath: results._posterPath))))
          }
        }
      case .failure(let failure):
        print("Error: \(failure.localizedDescription)")
      }
    }
  }
}
