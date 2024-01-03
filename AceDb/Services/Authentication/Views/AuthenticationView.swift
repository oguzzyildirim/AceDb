//
//  AuthenticationView.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 2.01.2024.
//

import SwiftUI

struct AuthenticationView: View {
  @Binding var isUserLogIn: Bool
    var body: some View {
      VStack{
        NavigationLink {
          SignInEmailView(isUserLogIn: $isUserLogIn)
        } label: {
          Text("Sign In")
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))

        }

        NavigationLink {
          SignUpView(isUserSignUp: $isUserLogIn)
        } label: {
          Text("Sign Up With Email")
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))

        }

        Spacer()

      }
      .padding()
      .navigationTitle("Welcome to The App")
    }
}

#Preview {
    NavigationStack{
      AuthenticationView(isUserLogIn: .constant(false))
    }
}
