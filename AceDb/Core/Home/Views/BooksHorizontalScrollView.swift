//
//  FilmsHorizontalScrollView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct BooksHorizontalScrollView: View {
  var body: some View {
    ZStack{
      Color.theme.secondaryBackgroundColor.ignoresSafeArea()
      ScrollView{
        VStack(alignment: .leading){
          VStack(alignment: .leading){
            Text("Horror")
              .foregroundStyle(Color.theme.accentColor)
            Capsule()
              .frame(width: 150, height: 4)
              .foregroundStyle(Color.theme.greenColor)
              .padding(.horizontal, 4)
          }
          .padding(.horizontal)

          ScrollView(.horizontal, showsIndicators: false) {
            HStack{
              ForEach(1..<10) { _ in
                //BookCardView(bookImage: url)
              }
            }
          }
        }
      }
      .padding(.horizontal, 4)
    }

  }
}

#Preview {
  BooksHorizontalScrollView()
}
