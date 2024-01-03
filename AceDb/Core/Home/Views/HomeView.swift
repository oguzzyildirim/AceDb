//
//  HomeView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct HomeView: View {
  @State private var navSelection = 0
    var body: some View {
      ZStack{
        //background layer
        Color.theme.backgroundColor.ignoresSafeArea()

        //content layer
        VStack{
          homeHeader
          NavSelectionView(navSelection: $navSelection)

          Capsule()
            .frame(width: 400, height: 1)
            .foregroundStyle(Color.theme.redColor)

          TabView(selection: $navSelection){
            PopularMovieView()
              .tag(0)
            NowPlayingMovieView()
              .tag(1)
            UpcomingMoviesView()
              .tag(2)
          }
          .tabViewStyle(.page(indexDisplayMode: .never))
          
          HStack{
            
          }
          Spacer(minLength: 0)
        }
      }
    }
}

#Preview {
    NavigationStack{
      HomeView()
        .toolbar(.hidden)
    }
}

extension HomeView{
  private var homeHeader: some View {
    HStack{
      Text("AceDb")
        .fontWeight(.heavy)
        .font(.largeTitle)
        .foregroundStyle(Color.theme.greenColor)

      Spacer()

      CircleButtonView(iconName: "dice.fill")
    }
    .padding(.horizontal)
  }
}
