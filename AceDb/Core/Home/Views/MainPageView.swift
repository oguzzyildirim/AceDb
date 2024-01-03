//
//  MainPageView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct MainPageView: View {
  @State private var selectedTab: Tab = .person
  @State private var isShowingSearchSheet: Bool = false
  @Binding var isUserLogOut: Bool
    var body: some View {
      ZStack{
        VStack{
          TabView(selection: $selectedTab) {
            switch selectedTab {
            case .house:
              HomeView()
            case .plus:
              Text("Add List")
            case .person:
              SettingsView(isUserLogOut: $isUserLogOut)
            }
          }
        }

        VStack{
          Spacer()
          CustomTabView(selectedTab: $selectedTab, isShowinSearchBar: $isShowingSearchSheet)
            .ignoresSafeArea()
        }
      }
      .onAppear{
        UITabBar.appearance().isHidden = true
      }


    }
}

#Preview {
  MainPageView(isUserLogOut: .constant(false))
}
