//
//  TabSelectionView.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 15.12.2023.
//

import SwiftUI

struct NavSelectionView: View {
  @Binding var navSelection: Int
  @Namespace private var buttonId
  private let selectionButtons: [String] = ["Popular", "Now Playing", "Upcoming"]
  var body: some View {
    HStack(alignment: .top) {
      ForEach(selectionButtons.indices, id: \.self) {index in
        VStack{
          Button(selectionButtons[index]) {
            withAnimation{
              navSelection = index
            }
          }
          .foregroundStyle(navSelection == index ? Color.theme.accentColor : Color.theme.secondaryText)
          .fontWeight(navSelection == index ? .heavy : .bold)
          .padding(.horizontal)

          if navSelection == index {
            Capsule()
              .frame(maxWidth: 120)
              .frame(height: 2)
              .padding(.horizontal, 4)
              .foregroundStyle(Color.theme.greenColor)
              .matchedGeometryEffect(id: "ID", in: buttonId)
          } else {
            EmptyView()
              .frame(height: 4)
              .matchedGeometryEffect(id: "ID", in: buttonId)
          }
        }
      }

    }
  }
}

#Preview {
  NavSelectionView(navSelection: .constant(1))
}
