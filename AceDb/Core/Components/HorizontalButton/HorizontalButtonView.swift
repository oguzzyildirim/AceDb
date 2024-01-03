//
//  HorizontalButtonView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct HorizontalButtonView: View {

  let buttonName: String
  let action: () -> Void
    var body: some View {
      Button(action: {
        action()
      }, label: {
        Text("\(buttonName)")
          .font(.headline)
          .fontWeight(.bold)
          .foregroundStyle(Color.theme.greenColor)
          .padding(.vertical, 6)
          .padding(.horizontal)
          .background(
            RoundedRectangle(cornerRadius: 15)
              .foregroundStyle(Color.theme.backgroundColor)
          )
          .shadow(color: Color.theme.accentColor.opacity(0.25), radius: 10, x: 0.0, y: 0.0)
          .padding()
      })
    }
}

#Preview(traits: .sizeThatFitsLayout) {
  HorizontalButtonView(buttonName: "Logout", action: {print("hello")})
}
