//
//  ContentView.swift
//  HappyGrad
//
//  Created by David Okun on 5/16/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var names: [String] = ["Tristan-Trevino", "Morgan-and-Tyler-Langlais", "Barnet-Levinson"]
  var body: some View {
    NavigationView {
      CongratsList(names: names)
        .navigationBarTitle("Congratulations!!!")
     
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(names: ["Tristan-Trevino", "Morgan-and-Tyler-Langlais", "Barnet-Levinson"])
  }
}
