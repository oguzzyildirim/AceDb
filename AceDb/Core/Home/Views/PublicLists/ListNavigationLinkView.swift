//
//  ListNavigationLinkView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct ListNavigationLinkView: View {
  @Binding var itemCount: Int
  @Binding var listName: String
  var body: some View {
    ZStack{
      UnevenRoundedRectangle(topLeadingRadius: 12, bottomTrailingRadius: 12)
        .foregroundStyle(Color.theme.secondaryBackgroundColor)

      NavigationLink(destination: {
        Text("List Content!")
      }, label: {
        HStack(alignment: .top){
          Circle()
            .frame(width: 12)
            .foregroundStyle(Color.theme.redColor)
            .offset(y: 5)
          
          VStack(alignment: .leading){
            Text("\(itemCount)")
              .foregroundStyle(Color.theme.accentColor)

            Text(listName)
              .font(.subheadline)
              .foregroundStyle(Color.theme.secondaryText)
          }
          
          Spacer()

          ListContentView()
        }
        .padding()
      })
      .padding(.trailing)
    }
  }
}

#Preview {
  ListNavigationLinkView(itemCount: .constant(2), listName: .constant("Favourite"))
}
