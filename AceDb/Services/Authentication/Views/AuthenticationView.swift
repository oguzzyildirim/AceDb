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
      VStack(spacing: 20){
        NavigationLink {
          SignInEmailView(isUserLogIn: $isUserLogIn)
        } label: {
          Text("Sign In")
            .font(.headline)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(
              RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.theme.redColor)
            )
            .shadow(color: Color.theme.greenColor.opacity(0.50), radius: 10, x: 0.0, y: 0.0)
        }

        NavigationLink {
          SignUpView(isUserSignUp: $isUserLogIn)
        } label: {
          Text("Sign Up With Email")
            .font(.headline)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(
              RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.theme.redColor)
            )
            .shadow(color: Color.theme.greenColor.opacity(0.50), radius: 10, x: 0.0, y: 0.0)

        }

        Spacer()

      }
      .padding()
      .background(
        Color.theme.backgroundColor
      )
      .navigationTitle("Welcome to The App")
    }
}

#Preview {
    NavigationStack{
      AuthenticationView(isUserLogIn: .constant(false))
    }
}

//          Text("Sign In")
//            .font(.headline)
//            .foregroundStyle(Color.white)
//            .frame(height: 55)
//            .frame(maxWidth: .infinity)
//            .background(Color.blue)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
