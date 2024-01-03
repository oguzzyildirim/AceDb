//
//  SettingsViewModel.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 2.01.2024.
//

import Foundation

@MainActor
final class SettingsViewModel: ObservableObject {

  func signOut() throws {
    try AuthenticationManager.shared.signOut()
  }

  func resetPassword() async throws {
    let authUser = try AuthenticationManager.shared.getAuthenticatedUser()

    guard let email = authUser.email else {
      throw URLError(.fileDoesNotExist)
    }

    try await AuthenticationManager.shared.resetPassword(email: email)
  }

  func updateEmail() async throws{
    let email = "hello000@gmail.com"
    try await AuthenticationManager.shared.updateEmail(email: email)
  }

  func updatePassword() async throws {
    let password = "newpass123"
    try await AuthenticationManager.shared.updatePassword(password: password)
  }

  func updatePassword() {

  }
}
