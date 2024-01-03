//
//  ListView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct ListView: View {
  @State var listName: String = "Sample List Name"
  @State var itemCount: Int = 5
    var body: some View {
      NavigationStack{
        List{
          ForEach(0..<5) { _ in
            ListRowView(listName: listName, itemCount: itemCount)
          }
        }
        .listStyle(.plain)
      }
    }
}

#Preview {
  ListView()
}
