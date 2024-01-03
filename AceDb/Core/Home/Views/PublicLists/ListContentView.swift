//
//  ListContentView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct ListContentView: View {

    var body: some View {
      ZStack{
        BookCardView(bookImage: URL(string: "https://lumiere-a.akamaihd.net/v1/images/p_disneymovies_avatarthewayofwater_streamingupdate_2096_0908fa1b.jpeg")!)

        BookCardView(bookImage: URL(string: "https://lumiere-a.akamaihd.net/v1/images/p_disneymovies_avatarthewayofwater_streamingupdate_2096_0908fa1b.jpeg")!)
          .offset(x: 30)

        BookCardView(bookImage: URL(string: "https://lumiere-a.akamaihd.net/v1/images/p_disneymovies_avatarthewayofwater_streamingupdate_2096_0908fa1b.jpeg")!)
          .offset(x: 60)
        
      }
      .frame(maxHeight: .infinity)
      .padding(.trailing)

    }
}

#Preview {
  ListContentView()
}
