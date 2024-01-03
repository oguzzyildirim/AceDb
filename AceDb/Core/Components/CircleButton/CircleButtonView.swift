//
//  CircleButtonView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct CircleButtonView: View {

  let iconName: String
  var body: some View {
    Image(systemName: iconName)
      .font(.headline)
      .foregroundStyle(Color.theme.greenColor)
      .frame(width: 50, height: 50)
      .background(
        Circle()
          .foregroundStyle(Color.theme.backgroundColor)
      )
      .shadow(color: Color.theme.accentColor.opacity(0.25), radius: 10, x: 0.0, y: 0.0)
      .padding()

  }
}

#Preview(traits: .sizeThatFitsLayout){

  Group{
    CircleButtonView(iconName: "info")
      .previewLayout(.sizeThatFits)
      .preferredColorScheme(.dark)

    CircleButtonView(iconName: "plus")
      .previewLayout(.sizeThatFits)
      .preferredColorScheme(.dark)
  }

}
