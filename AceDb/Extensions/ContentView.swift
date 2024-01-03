//
//  ContentView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack {
        Color.theme.secondaryBackgroundColor.ignoresSafeArea()

        VStack(spacing: 40) {
          
          Text("Accent Color")
            .foregroundStyle(Color.theme.accentColor)

//          Text("Secondary Back Ground")
//            .foregroundStyle(Color.theme.secondaryBackgroundColor)

          Text("Secondary Text Color")
            .foregroundStyle(Color.theme.secondaryText)

          Text("Red Color")
            .foregroundStyle(Color.theme.redColor)

          Text("Green Color")
            .foregroundStyle(Color.theme.greenColor)
        }
      }

    }
}

#Preview {
    ContentView()
}
