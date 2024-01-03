//
//  UserListRowView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct ProfileListRowView: View {
  let content: String
  var body: some View {
    ZStack{
      UnevenRoundedRectangle(topLeadingRadius: 6, bottomTrailingRadius: 6)
        .foregroundStyle(Color.theme.secondaryBackgroundColor)

      NavigationLink(destination: {
        Text(content)
          .foregroundStyle(Color.theme.accentColor)
      }, label: {
        HStack(alignment: .top){
          Text(content)
            .padding(.horizontal)
            .foregroundStyle(Color.theme.accentColor)
        }
      })
    }
  }
}

#Preview {
    ProfileListRowView(content: "Activity")
}
