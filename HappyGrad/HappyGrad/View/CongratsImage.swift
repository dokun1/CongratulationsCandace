//
//  CongratsImage.swift
//  HappyGrad
//
//  Created by David Okun on 5/18/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CongratsImage: View {
  var imageURL: URL
  
  var body: some View {
    WebImage(url: imageURL)
      .resizable()
      .indicator(.activity)
      .animation(.default)
      .aspectRatio(contentMode: .fill)
      .frame(width: 250, height: 250)
      .clipShape(Circle())
      .overlay(Circle().stroke(Color.pink, lineWidth: 4))
      .shadow(color: Color.pink, radius: 20)
      .padding()
  }
}

struct CongratsImage_Previews: PreviewProvider {
  static var previews: some View {
    CongratsImage(imageURL: URL(fileURLWithPath: "hey"))
  }
}
