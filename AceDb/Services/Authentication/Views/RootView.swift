//
//  RootView.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 2.01.2024.
//

import SwiftUI

struct RootView: View {
  @State private var isUserLogIn: Bool = true
  var body: some View {
    ZStack{
      NavigationStack{
        MainPageView(isUserLogOut: $isUserLogIn)
      }

    }
    .onAppear {
      let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
      self.isUserLogIn = authUser == nil
    }
    .fullScreenCover(isPresented: $isUserLogIn, content: {
      NavigationStack{
        AuthenticationView(isUserLogIn: $isUserLogIn)
      }
    })

  }

}

#Preview {
  RootView()
}
