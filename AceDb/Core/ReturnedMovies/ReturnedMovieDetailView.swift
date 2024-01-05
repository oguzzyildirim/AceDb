//
//  ReturnedMovieDetailView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 29.12.2023.
//

import SwiftUI
import Kingfisher

struct ReturnedMovieDetailView: View {
  @State var isBackground: Bool = true
  var movie: MovieResponse
  var body: some View {
    ScrollView{
      VStack(spacing: 15){
        if isBackground {

          if let url = URL(string: APIURLs.imageUrl(posterPath: movie._backdropPath)){
            KFImage(url) // Image'ın adını değiştirmeyi unutma
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(maxWidth: .infinity, maxHeight: 300)
              .ignoresSafeArea()
          }



        }

        VStack(alignment: .leading, spacing: 10){
          Text(movie._originalTitle)
            .foregroundStyle(Color.theme.accentColor)
            .font(.title2)
            .fontWeight(.heavy)
            .fontDesign(.rounded)
            .multilineTextAlignment(.leading)

          Text(movie._overview)
            .foregroundStyle(Color.theme.secondaryText)
            .font(.subheadline)
            .fontWeight(.semibold)

          HStack{
            HStack{
              Button {
                print("..")
              } label: {
                addToListButtonLabel
              }



              Image("ImdbIcon")
                .resizable()
                .frame(width: 30, height: 30)

              Image(systemName: "star.fill")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundStyle(Color.yellow)

              Text(String(format: "%.1f", movie._voteAverage))
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.theme.accentColor)
            }

            Spacer()



            Text(movie._releaseDate)


          }

          Capsule()
            .frame(width: 600, height: 2)
            .foregroundStyle(Color.theme.redColor)

          Text("Similar Movies")
            .foregroundStyle(Color.theme.secondaryText)

          SimilarMovieView(movieId: .constant(movie._id))



        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()

      }







      Spacer()
    }
    .ignoresSafeArea()
    .background(Color.theme.backgroundColor)

  }
}

#Preview {
  ReturnedMovieDetailView(movie: MovieResponse(backdropPath: nil, id: nil, genreIds: nil, originalTitle: nil, overview: nil, popularity: nil, posterPath: nil, releaseDate: nil, voteAverage: nil))
}

extension ReturnedMovieDetailView {

  private var addToListButtonLabel: some View {
    Text("Add to list")
      .font(.headline)
      .fontWeight(.bold)
      .foregroundStyle(Color.black)
      .frame(height: 30)
      .frame(maxWidth: 140)
      .background(
        RoundedRectangle(cornerRadius: 15)
          .foregroundStyle(Color("ImdbYellow"))
      )
//      .shadow(color: Color.theme.redColor.opacity(0.5), radius: 10, x: 0.0, y: 0.0)
  }
}
