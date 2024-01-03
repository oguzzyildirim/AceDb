//
//  ReturnedMovieRowView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 29.12.2023.
//

import SwiftUI
import Kingfisher

struct ReturnedMovieRowViewContentView: View {
  var posterPath: String
  var movieTitle: String
  @State private var imageVisible = true
  var body: some View {
    VStack(alignment: .center) {
      if let url = URL(string: APIURLs.imageUrl(posterPath: posterPath)){
        if imageVisible {
          KFImage(url)
            .onFailure { _ in
              imageVisible = false
            }
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 100)
        } else {
          placeHolderImage
        }

      } else {
        Image("ClapperBoardImage")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: 100)
      }


      Text(movieTitle)
        .font(.headline)
        .foregroundStyle(Color.theme.accentColor)
        .frame(maxWidth: 200)
        .padding(.top, 10)

    }

  }
}

extension ReturnedMovieRowViewContentView {
  private var placeHolderImage: some View {
    Image("ClapperBoardImage")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(maxWidth: 100)
  }
}

#Preview {
  ReturnedMovieRowViewContentView(posterPath: "/ui4DrH1cKk2vkHshcUcGt2lKxCm.jpg", movieTitle: "Harry Potter and the plisoasdsadsadsadsadsaasdasdsaasdasdsa")
}

