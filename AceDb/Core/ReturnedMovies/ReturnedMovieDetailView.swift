//
//  ReturnedMovieDetailView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 29.12.2023.
//

import SwiftUI

struct ReturnedMovieDetailView: View {
  @State var isBackground: Bool = true
  var body: some View {
    VStack{
      if isBackground {

        Image("SampleBackgroundImage") // Image'ın adını değiştirmeyi unutma
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(maxWidth: .infinity, maxHeight: 250)
          .clipShape(.buttonBorder )
          .ignoresSafeArea()


      }





      Text("Card")
        .font(.largeTitle)

      Spacer()
    }
    .background(Color.theme.secondaryBackgroundColor)

  }
}

#Preview {
  ReturnedMovieDetailView()
}
