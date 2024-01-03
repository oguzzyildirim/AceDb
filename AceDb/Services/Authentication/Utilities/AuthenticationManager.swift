//
//  AuthenticationManager.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 2.01.2024.
//

import Foundation
import FirebaseAuth

@MainActor
final class AuthenticationManager {
  static let shared = AuthenticationManager()
  private init() { }

  func getAuthenticatedUser() throws -> AuthDataResultModel {
    guard let user = Auth.auth().currentUser else {
      // MARK: Create custom errors!
      throw URLError(.badServerResponse)
    }

    return AuthDataResultModel(user: user)
  }

  @discardableResult
  func createUser(email: String, password: String) async throws -> AuthDataResultModel {
    let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
    return AuthDataResultModel(user: authDataResult.user)
  }

  @discardableResult
  func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
    let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
    return AuthDataResultModel(user: authDataResult.user)
  }

  func resetPassword(email: String) async throws {
    try await Auth.auth().sendPasswordReset(withEmail: email)
  }

  func updatePassword(password: String) async throws {
    guard let authUser = Auth.auth().currentUser else {
      throw URLError(.fileDoesNotExist)
    }

    try await authUser.updatePassword(to: password)
  }

  /* MARK: Update this function with 'authUser.sendEmailVerification(beforeUpdatingEmail email: String)' instead
           of authUser.updateemail(to: String)
   */
  func updateEmail(email: String) async throws {
    guard let authUser = Auth.auth().currentUser else {
      throw URLError(.fileDoesNotExist)
    }

    try await authUser.updateEmail(to: email)
  }

  func signOut() throws {
    try Auth.auth().signOut()
  }
}
