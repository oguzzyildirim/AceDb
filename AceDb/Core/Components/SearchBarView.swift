//
//  SearchBarView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 30.12.2023.
//

import SwiftUI

struct SearchBarView: View {
  @Binding var text: String
  @Binding var prompt: String
  var body: some View {
    HStack{
      Image(systemName: "magnifyingglass")
        .foregroundStyle(
          text.isEmpty ? Color.theme.secondaryText : Color.theme.redColor
        )

      TextField(prompt, text: $text)
        .foregroundStyle(Color.theme.accentColor)
        .overlay(
          Image(systemName: "xmark.circle.fill")
            .foregroundStyle(Color.theme.redColor)
            .padding()
            .offset(x: 10)
            .opacity(text.isEmpty ? 0.0 : 1.0)
            .onTapGesture {
              text = ""
            }
          , alignment: .trailing
        )
    }
    .font(.headline)
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 25)
        .fill(Color.theme.backgroundColor)
        .shadow(color: Color.theme.redColor.opacity(0.30), radius: 10)
    )
    .padding()
  }
}

#Preview {
  SearchBarView(text: .constant(""), prompt: .constant("Search movie"))
}
