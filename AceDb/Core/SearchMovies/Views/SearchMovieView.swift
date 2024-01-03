//
//  SearchMovieView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 29.12.2023.
//

import SwiftUI

struct SearchMovieView: View {
  @StateObject var vm: SearchMovieViewModel = SearchMovieViewModel()
  @State var searchTerm: String = ""
  @State var posterPath: String = ""
  var body: some View {
    NavigationStack{
      VStack{
        SearchBarView(text: $searchTerm, prompt: .constant("Search movie"))

        List {

          ForEach(vm.returnedMovies, id: \.id) { movies in
            ForEach(movies._results) { movie in
              NavigationLink(destination: {
                Text(movie._originalTitle)
              }, label: {
                ReturnedMovieRowViewContentView(posterPath: movie._posterPath, movieTitle: movie._originalTitle)

              })

            }
          }


        }
        .listStyle(PlainListStyle())
      }

    }
    .onChange(of: searchTerm) {
      if !searchTerm.isEmpty && searchTerm.count > 0 {
        Task {
          vm.getMovies(searchTerm: searchTerm, page: "1")
        }
      } else {
        vm.returnedMovies.removeAll()
      }

    }

  }


}

#Preview {
  SearchMovieView()
}
