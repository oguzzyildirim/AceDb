//
//  String+Extensions.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 23.12.2023.
//

import Foundation

extension String {
  func trimmed() -> String {
    self.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
