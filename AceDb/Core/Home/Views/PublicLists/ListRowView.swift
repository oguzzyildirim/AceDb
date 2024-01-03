//
//  ListView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct ListRowView: View {
  @State var listName: String = ""
  @State var itemCount: Int = 0
  var body: some View {
    VStack{
      HStack(alignment: .top){
        Text("Favorites")
          .font(.headline)
        Spacer()
      }

      ListNavigationLinkView(itemCount: $itemCount, listName: $listName)

    }
    .padding(.vertical)
    .listRowSeparator(.hidden)
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  ListRowView()

}
