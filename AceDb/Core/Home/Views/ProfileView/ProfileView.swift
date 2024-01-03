//
//  ProfileView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct ProfileView: View {
  var body: some View {
    NavigationStack {
      VStack(spacing: 20){
        profileHeader

        Image(systemName: "person.fill")
          .resizable()
          .frame(width: 100, height: 100)
          .foregroundStyle(Color.theme.accentColor)

        ProfileListView()



        Spacer()
      }
    }


  }
}

#Preview {
  ProfileView()
}

extension ProfileView {
  private var profileHeader: some View {
    VStack{
      HStack(alignment: .top) {

        NavigationLink(destination: {
          Text("Profile Settings")
            .foregroundStyle(Color.theme.accentColor)
        }, label: {
          Image(systemName: "gear")
            .foregroundStyle(Color.theme.greenColor)
            .font(.largeTitle)
            .fontWeight(.bold)
        })
        Spacer()

        Text("username")
          .font(.title)
          .fontWeight(.heavy)
          .foregroundStyle(Color.theme.accentColor)
          .padding(.vertical, 6)


        Spacer()

        Image(systemName: "gear")
          .opacity(0.0)

      }
      .padding(.horizontal)

      Capsule()
        .foregroundStyle(Color.theme.redColor)
        .frame(width: 400, height: 1)
    }
  }
}
