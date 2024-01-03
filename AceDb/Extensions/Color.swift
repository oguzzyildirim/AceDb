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
  let greenColor = Color("GreenColor")
  let redColor = Color("RedColor")
  let secondaryText = Color("SecondaryTextColor")
}
