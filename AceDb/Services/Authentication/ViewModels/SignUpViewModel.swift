//
//  SignUpViewModel.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 2.01.2024.
//

import Foundation

@MainActor
final class SignUpViewModel: ObservableObject {
  
  @Published var email = ""
  @Published var password = ""
  @Published var passwordIsCorrect = ""
  @Published var showAlert = false
  @Published var alertMessage = ""

  // MARK: - Validation logics here

  private var isInputValid: Bool {
    return isValidEmail(email) && isValidPassword(password)
  }

  private func isValidEmail(_ email: String) -> Bool {
    // Basit bir e-posta format kontrolü
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
  }

  private func isValidPassword(_ password: String) -> Bool {
    // Şifrenin minimum uzunluğu ve en az bir harf içermesi kontrolü
    let minimumLength = 6
    let containsLetter = password.rangeOfCharacter(from: .letters) != nil
    return password.count >= minimumLength && containsLetter
  }

  // MARK: - FirebaseAuth logics here

  func signUp() async throws {
    do {
      guard isInputValid && checkPassword else {
        throw URLError(.badServerResponse)
      }

      try await AuthenticationManager.shared.createUser(email: email, password: password)
    } catch {
      if !checkPassword {
        alertMessage = "Please double-check the entered passwords"
      } else {
        alertMessage = "Please enter a valid email and password"
      }
      showAlert = true
      throw URLError(.badServerResponse)
    }
  }

  private var checkPassword: Bool {
    return password == passwordIsCorrect
  }
}
