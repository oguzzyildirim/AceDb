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
  var description: String
  var releaseDate: String
  @State private var imageVisible = true
  var body: some View {
    VStack{
      HStack {
        if let url = URL(string: APIURLs.imageUrl(posterPath: posterPath)){
          if imageVisible {
            KFImage(url)
              .onFailure { _ in
                imageVisible = false
              }
              .resizable()
              //.aspectRatio(contentMode: .fit)
              .frame(maxWidth: 170)
              .frame(maxHeight: 300)
          } else {
            placeHolderImage
          }

        } else {
          Image("ClapperBoardImage")
            .resizable()
            //.aspectRatio(contentMode: .fit)
            .frame(maxWidth: 170)
            .frame(maxHeight: 300)
        }


        VStack(alignment: .leading){
          Text(movieTitle)
            .font(.headline)
            .foregroundStyle(Color.theme.accentColor)


          Text(description)
            .font(.subheadline)
            .foregroundStyle(Color.theme.secondaryText)
            .multilineTextAlignment(.leading)




          Spacer()


        }
        .padding(.top, 5)
        .frame(width: 200, alignment: .leading)





      }
      .frame(height: 240)

      HStack{
        Text(".")
          .opacity(0.0)

        Spacer()

        Text(releaseDate)
          .font(.subheadline)
          .foregroundStyle(Color.theme.secondaryText)
          .fontWeight(.bold)
          .frame(alignment: .leading)


      }




    }
    .padding(.bottom, 10)


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
  ReturnedMovieRowViewContentView(posterPath: "/ui4DrH1cKk2vkHshcUcGt2lKxCm.jpg", movieTitle: "Harry Potter", description: "asdasdsadasdsadsaasdasdsadsadsadsaasdasdasdas asdasdasdasdasasdasdasdsadsadsadsaasdsadsadsadsadsadsadsadsa asdsadsa asdasd asdasdasdsa asdasasdsa asdas asdassadasd asdsadsa asdsadsadsadsadsadsadsadasdsadsa", releaseDate: "2022")
}

