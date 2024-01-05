//
//  PopularMovieView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 1.01.2024.
//

import SwiftUI
import Kingfisher

struct PopularMovieView: View {
  @StateObject private var viewModel: PopularMovieViewModel = PopularMovieViewModel()
  var body: some View {
    
    VStack {
      
      List {
        ForEach(viewModel.returnedPopularMovies.flatMap(\._results), id: \.movieId) { movie in
          NavigationLink(destination: {
            ReturnedMovieDetailView(movie: movie)
          }, label: {
            ReturnedMovieRowViewContentView(posterPath: movie._posterPath, movieTitle: movie._originalTitle, description: movie._overview, releaseDate: movie._releaseDate)
          })
        }
        
        if viewModel.currentPage < viewModel.totalPage {
          Text("")
            .foregroundStyle(Color.white)
            .onAppear {
              viewModel.currentPage = viewModel.currentPage + 1
              viewModel.getPopularMovies()
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
        viewModel.getPopularMovies()
      }
    }
    
  }
}

#Preview {
  NavigationStack{
    PopularMovieView()
  }
}
