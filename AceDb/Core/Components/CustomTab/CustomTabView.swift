//
//  CustomTabView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
  case house
  case plus
  case person
}

struct CustomTabView: View {
  @Binding var selectedTab: Tab
  @Binding var isShowinSearchBar: Bool

  private var fillImage: String {
    if(selectedTab.rawValue == "plus") {
      selectedTab.rawValue + ".circle"
    }
    else {
      selectedTab.rawValue + ".fill"
    }
  }
    var body: some View {
      VStack {
        HStack(alignment: .bottom){
          Spacer()
          Button(action: {
            isShowinSearchBar.toggle()
          }, label: {
            Image(systemName: "magnifyingglass.circle.fill")
              .font(.system(size: 22))
              .padding(.top, 5)
              .padding(.leading, 30)
              .scaleEffect(1.25)
              .foregroundStyle(Color.theme.redColor)
          })
          .sheet(isPresented: $isShowinSearchBar, content: {
            SearchMovieView()
              .presentationDragIndicator(.visible)
              .presentationDetents([.fraction(0.95)])
          })

          Spacer()
          ForEach(Tab.allCases, id: \.rawValue) { tab in
            Spacer()
            Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
              .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
              .foregroundStyle(selectedTab == tab ? Color.theme.greenColor : Color.theme.secondaryText)
              .font(.system(size: 22))
              .onTapGesture {
                withAnimation(.easeIn(duration: 0.1)) {
                  selectedTab = tab
                }
              }
              .padding(.top, 5)
            Spacer()
          }
          Spacer()

        }
        .padding()
        .background(Color.theme.backgroundColor)
      }
    }
}

#Preview {
  CustomTabView(selectedTab: .constant(.house), isShowinSearchBar: .constant(false))
}
