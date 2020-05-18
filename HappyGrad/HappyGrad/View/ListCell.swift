//
//  ListCell.swift
//  HappyGrad
//
//  Created by David Okun on 5/16/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import SwiftUI

struct ListCell: View {
  @State var imageName = ""
  var body: some View {
    VStack {
      Image(imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 250, height: 250)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.pink, lineWidth: 4))
        .shadow(radius: 10)
        .padding()
      Text(imageName.replacingOccurrences(of: "-", with: " "))
        .font(.title)
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
    }
  }
}

struct ListCell_Previews: PreviewProvider {
  static var previews: some View {
    ListCell(imageName: "Barnet-Levinson")
  }
}
