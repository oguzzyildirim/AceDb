//
//  MovieCardView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct BookCardView: View {
  let cardImage: URL = URL(string: "https://e7.pngegg.com/pngimages/929/679/png-clipart-war-ace-of-spades-playing-card-ace-of-spades-game-text.png")!

  let bookImage: URL

  var body: some View {
    ZStack {
      AsyncImage(url: cardImage) { phase in
        switch phase {
        case .empty:
          Image("Card")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)

        case .success(let image):
          image
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)

        case .failure(_):
          Color.red

        @unknown default:
          Color.gray
        }
      }

      AsyncImage(url: bookImage) { phase in
        switch phase {
        case .empty:
          Image("Card")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 77)

        case .success(let image):
          image
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 77)

        case .failure(_):
          Color.red

        @unknown default:
          Color.gray
        }
      }
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  BookCardView(bookImage: URL(string: "")!)
}
