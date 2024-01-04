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
          .foregroundStyle(Color.white)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(
            RoundedRectangle(cornerRadius: 15)
              .foregroundStyle(Color.theme.greenColor)
          )
          .shadow(color: Color.theme.redColor.opacity(0.60), radius: 10, x: 0.0, y: 0.0)

      })
      .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
  HorizontalButtonView(buttonName: "Sign In", action: {print("hello")})
}
