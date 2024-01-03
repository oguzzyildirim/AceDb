//
//  SettingsView.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 2.01.2024.
//

import SwiftUI

struct SettingsView: View {
  @StateObject private var viewModel: SettingsViewModel = SettingsViewModel()
  @Binding var isUserLogOut: Bool
  @State private var showAlert = false
  @State private var alertMessage: String = ""

  var body: some View {
    List{
      Button("Log out") {
        Task {
          do {
            try viewModel.signOut()
            isUserLogOut = true
          } catch {
            print("Error while sign out: \(error)")
          }
        }
      }

      emailSection




    }
    .navigationTitle("Settings")
  }
}

#Preview {
  NavigationStack{
    SettingsView(isUserLogOut: .constant(false))
  }
}

extension SettingsView {

  private var emailSection: some View {
    Section {
      Button("Reset password") {
        Task {
          do {
            try await viewModel.resetPassword()
            alertMessage = "Your password has been successfully reset."
            showAlert = true
          } catch {
            print("Error while reset password: \(error)")
          }
        }
      }
      .alert(isPresented: $showAlert) {
        Alert(title: Text("Success"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
      }

      Button("Update password") {
        Task {
          do {
            try await viewModel.updatePassword()
            alertMessage = "Your password has been successfully updated."
            showAlert = true
          } catch {
            print("Error while update password: \(error)")
          }
        }
      }
      .alert(isPresented: $showAlert) {
        Alert(title: Text("Success"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
      }

      Button("Update email") {
        Task {
          do {
            try await viewModel.updateEmail()
            alertMessage = "Your email has been successfully updated."
            showAlert = true
          } catch {
            alertMessage = "Error while update email: \(error)"
            showAlert = true
          }
        }
      }
      .alert(isPresented: $showAlert) {
        Alert(title: Text("Success"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
      }
    } header: {
      Text("Email functions")
    }
  }
}
