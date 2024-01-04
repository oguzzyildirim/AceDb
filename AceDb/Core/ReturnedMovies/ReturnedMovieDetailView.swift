//
//  ReturnedMovieDetailView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 29.12.2023.
//

import SwiftUI

struct ReturnedMovieDetailView: View {
  @State var isBackground: Bool = true
  @Binding var movieId: Int
  var body: some View {
    ScrollView{
      VStack(spacing: 15){
        if isBackground {

          Image("SampleBackgroundImage") // Image'ın adını değiştirmeyi unutma
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: 300)
            .ignoresSafeArea()



        }

        VStack(alignment: .leading, spacing: 10){
          Text("Harry Potter")
            .foregroundStyle(Color.theme.accentColor)
            .font(.title2)
            .fontWeight(.heavy)
            .fontDesign(.rounded)
            .multilineTextAlignment(.leading)

          Text("overview")
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

              Text(String(format: "%.1f", 7.5))
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.theme.accentColor)
            }

            Spacer()



            Text("08-08-2023")


          }

          Capsule()
            .frame(width: .infinity, height: 2)
            .foregroundStyle(Color.theme.redColor)

          Text("Similar Movies")
            .foregroundStyle(Color.theme.secondaryText)



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
  ReturnedMovieDetailView(movieId: .constant(0))
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
