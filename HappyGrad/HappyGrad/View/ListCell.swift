//
//  ListCell.swift
//  HappyGrad
//
//  Created by David Okun on 5/16/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import SwiftUI

struct ListCell: View {
  @State var imageName = "barnet.png"
  var body: some View {
    VStack {
      Image(imageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 200, height: 200)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
        .padding()
      Text(imageName)
        .font(.title)
        .fontWeight(.heavy)
    }
  }
}

struct ListCell_Previews: PreviewProvider {
  static var previews: some View {
    ListCell(imageName: "david")
  }
}
