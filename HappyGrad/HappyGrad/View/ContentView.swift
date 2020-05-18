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
  
  init(model: ViewModel) {
    self.viewModel = model
  }
  
  var body: some View {
    NavigationView {
      CongratsList(items: self.viewModel.allItems)
        .navigationBarTitle("Congratulations!!!")
    }
    .alert(item: self.$viewModel.error) { error in
      Alert(
        title: Text("Network error"),
        message: Text(error.localizedDescription),
        dismissButton: .cancel()
      )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(model: ViewModel())
  }
}
