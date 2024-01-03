//
//  AuthDataResultModel.swift
//  AceDb
//
//  Created by Oğuz Yıldırım on 2.01.2024.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
  let uid: String
  let email: String?
  let photoUrl: String?

  init(user: User) {
    self.uid = user.uid
    self.email = user.email
    self.photoUrl = user.photoURL?.absoluteString
  }
}
