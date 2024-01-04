//
//  NowPlayingMovieView.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 3.01.2024.
//

import SwiftUI
import Kingfisher

struct NowPlayingMovieView: View {
  @StateObject private var viewModel: NowPlayingMovieModel = NowPlayingMovieModel()
    var body: some View {
      VStack {

        List {
          ForEach(viewModel.returnedNowPlayingMovies.flatMap(\._results), id: \.movieId) { movie in
            NavigationLink(destination: {
              Text(movie._originalTitle)
            }, label: {
              ReturnedMovieRowViewContentView(posterPath: movie._posterPath, movieTitle: movie._originalTitle, description: movie._overview, releaseDate: movie._releaseDate)
            })
          }

          if viewModel.currentPage < viewModel.totalPage {
            Text("")
              .foregroundStyle(Color.white)
              .onAppear {
                viewModel.currentPage = viewModel.currentPage + 1
                viewModel.getNowPlayingMovies()
              }
          }
          else {
            EmptyView()
          }
        }
        .listStyle(PlainListStyle())
      }
      .onAppear {
        ImageCache.default.clearMemoryCache()
        if viewModel.currentPage < viewModel.totalPage {
          viewModel.getNowPlayingMovies()
        }
      }
    }
}

#Preview {
    NowPlayingMovieView()
}
