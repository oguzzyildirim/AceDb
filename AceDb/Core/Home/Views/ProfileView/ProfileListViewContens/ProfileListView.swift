//
//  UserListView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

enum ListContent: String, CaseIterable {
  case Films
  case Diary
  case Reviews
  case Lists
  case WatchList
  case Likes
}
struct ProfileListView: View {
    var body: some View {
      NavigationStack{
        List{
          ForEach(ListContent.allCases, id:\.rawValue){ content in
            ProfileListRowView(content: content.rawValue)
          }
        }
        .listStyle(.plain)
        .listRowSpacing(20)
        .padding(.horizontal, -18)
      }

    }
}

#Preview {
    ProfileListView()
}
