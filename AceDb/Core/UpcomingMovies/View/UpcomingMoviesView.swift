//
//  UpcomingMoviesView.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 3.01.2024.
//

import SwiftUI
import Kingfisher

struct UpcomingMoviesView: View {
  @StateObject private var viewModel: UpcomingMoviesViewModel = UpcomingMoviesViewModel()
    var body: some View {
      VStack {

        List {
          ForEach(viewModel.returnedUpcomingMovies.flatMap(\._results), id: \.movieId) { movie in
            NavigationLink(destination: {
              Text(movie._originalTitle)
            }, label: {
              ReturnedMovieRowViewContentView(posterPath: movie._posterPath, movieTitle: movie._originalTitle)
            })
          }

          if viewModel.currentPage < viewModel.totalPage {
            Text("")
              .foregroundStyle(Color.white)
              .onAppear {
                viewModel.currentPage = viewModel.currentPage + 1
                viewModel.getUpcomingMovies()
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
          viewModel.getUpcomingMovies()
        }
      }
      .onDisappear {
        if viewModel.currentPage < viewModel.totalPage {
          viewModel.currentPage = viewModel.currentPage + 1
          viewModel.getUpcomingMovies()
        }
      }
    }
}

#Preview {
    UpcomingMoviesView()
}
