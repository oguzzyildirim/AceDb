//
//  SignUpView.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 2.01.2024.
//

import SwiftUI

struct SignUpView: View {
  @StateObject private var viewModel: SignUpViewModel = SignUpViewModel()
  @Binding var isUserSignUp: Bool

    var body: some View {
      VStack{
        TextField("Email...", text: $viewModel.email)
          .padding()
          .background(Color.gray.opacity(0.4))
          .clipShape(RoundedRectangle(cornerRadius: 10))

        SecureField("Password...", text: $viewModel.password)
          .padding()
          .background(Color.gray.opacity(0.4))
          .clipShape(RoundedRectangle(cornerRadius: 10))

        SecureField("Password again...", text: $viewModel.passwordIsCorrect)
          .padding()
          .background(Color.gray.opacity(0.4))
          .clipShape(RoundedRectangle(cornerRadius: 10))


        Button(action: {
          Task{
            do {
              try await viewModel.signUp()
              isUserSignUp = false
            } catch {
              isUserSignUp = true
            }
          }
        }, label: {
          Text("Sign Up With Email")
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        })

        Spacer()
      }
      .padding()
      .navigationTitle("Sign Up With Email")
      .alert(isPresented: $viewModel.showAlert) {
        Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
      }
    }
}

#Preview {
    NavigationStack{
      SignUpView(isUserSignUp: .constant(false))
    }
}
