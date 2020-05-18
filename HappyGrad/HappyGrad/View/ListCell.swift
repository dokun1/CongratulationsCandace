//
//  ListCell.swift
//  HappyGrad
//
//  Created by David Okun on 5/16/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct ListCell: View {
  var cellItem: CongratsItem
  var body: some View {
    VStack {
      WebImage(url: cellItem.imageURL)
        .resizable()
        .indicator(.activity)
        .animation(.default)
        .aspectRatio(contentMode: .fill)
        .frame(width: 250, height: 250)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.pink, lineWidth: 4))
        .shadow(radius: 10)
        .padding()
      Text(cellItem.displayName)
        .font(.title)
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
    }.padding()
  }
}

struct ListCell_Previews: PreviewProvider {
  static var previews: some View {
    ListCell(cellItem: CongratsItem(id: "dfghdfu", name: "Morgan-Langlais"))
  }
}
