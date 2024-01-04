//
//  Color.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import Foundation
import SwiftUI

extension Color {
  
  static let theme = ColorTheme()
}

struct ColorTheme {
  let accentColor = Color("AccentColor")
  let backgroundColor = Color("BackgroundColor")
  let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
  let greenColor = Color("ThemeGreenColor")
  let redColor = Color("ThemeRedColor")
  let secondaryText = Color("SecondaryTextColor")
}
