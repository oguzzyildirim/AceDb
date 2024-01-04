//
//  SignInEmailView.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 2.01.2024.
//

import SwiftUI

struct SignInEmailView: View {
  @StateObject private var viewModel: SignInEmailViewModel = SignInEmailViewModel()
  @Binding var isUserLogIn: Bool

    var body: some View {
      VStack(spacing: 20){
        TextField("Email...", text: $viewModel.email)
          .padding()
          .background(Color.gray.opacity(0.4))
          .clipShape(RoundedRectangle(cornerRadius: 10))

        SecureField("Password...", text: $viewModel.password, onCommit: {
          Task{
            do {
              try await viewModel.signIn()
              isUserLogIn = false
            } catch {
              isUserLogIn = true
            }
          }
        })
          .padding()
          .background(Color.gray.opacity(0.4))
          .clipShape(RoundedRectangle(cornerRadius: 10))


        Button(action: {
          Task{
            do {
              try await viewModel.signIn()
              isUserLogIn = false
            } catch {
              isUserLogIn = true
            }
          }
        }, label: {
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
        })

        Spacer()
      }
      .padding()
      .navigationTitle("Sign In With Email")
      .alert(isPresented: $viewModel.showAlert) {

        Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))

      }
    }
}

#Preview {
    NavigationStack{
      SignInEmailView(isUserLogIn: .constant(false))
    }
}
