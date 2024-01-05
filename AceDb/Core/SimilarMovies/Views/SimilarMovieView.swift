//
//  SimilarMovieView.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 4.01.2024.
//

import SwiftUI
import Kingfisher
import Combine

struct SimilarMovieView: View {
  @StateObject private var viewModel = SimilarMovieViewModel()
  @Binding var movieId: Int
  @State private var imageVisible = true



  var body: some View {

    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 20){
        ForEach(viewModel.returnedSimilarMovies.flatMap(\._results), id: \.movieId) { movie in
          if let url = URL(string: APIURLs.imageUrl(posterPath: movie._posterPath)) {

            
            VStack(alignment: .center){
              KFImage(url)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)

              Text(movie._originalTitle)
                .foregroundStyle(Color.theme.accentColor)
                .font(.title3)
                .frame(maxWidth: 200)
                .multilineTextAlignment(.center)

            }
            .frame(height: 400)
          }
        }
      }
      .padding(.horizontal)

    }
    .onAppear {
      viewModel.getSimilarMovies(movieId: movieId)
    }



  }
}

extension SimilarMovieView {
  private var placeHolderImage: some View {
    Image("ClapperBoardImage")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(maxWidth: 100)
  }
}


#Preview {
  SimilarMovieView(movieId: .constant(848326))
}
