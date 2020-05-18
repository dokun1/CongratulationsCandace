//
//  ContentView.swift
//  HappyGrad
//
//  Created by David Okun on 5/16/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel: ViewModel
  @State var showConstantMessage = false
  
  init(model: ViewModel) {
    self.viewModel = model
  }
  
  var body: some View {
    NavigationView {
      CongratsList(items: self.viewModel.allItems)
        .navigationBarTitle("Congratulations!!!")
        .navigationBarItems(trailing:
          HStack {
            Button(action: {
              self.viewModel.fetchImageNames()
            }, label: {
              Image(systemName: "arrow.clockwise")
            })
            Button(action: {
              self.showConstantMessage.toggle()
            }, label: {
              Image(systemName: "message")
            })
          }
      )
      }
    .alert(item: self.$viewModel.error) { error in
      Alert(
        title: Text("Network error"),
        message: Text(error.localizedDescription),
        dismissButton: .cancel()
      )
    }.alert(isPresented: self.$showConstantMessage) {
      Alert(title: Text("I love you so much"), message: Text("I am so proud of you and I want you to always have a reminder in your pocket of how loved and admired you are ❤️"), dismissButton: .cancel())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(model: ViewModel())
  }
}
