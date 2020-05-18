//
//  CongratsCell.swift
//  HappyGrad
//
//  Created by David Okun on 5/16/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import SwiftUI

struct CongratsCell: View {
  var cellItem: CongratsItem
  
  var body: some View {
    VStack {
      CongratsImage(imageURL: cellItem.imageURL)
      Text(cellItem.displayName)
        .font(.title)
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
    }.padding()
  }
}

struct ListCell_Previews: PreviewProvider {
  static var previews: some View {
    CongratsCell(cellItem: CongratsItem(id: "dfghdfu", name: "Morgan-Langlais"))
  }
}
