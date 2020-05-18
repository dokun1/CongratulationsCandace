//
//  ViewModel.swift
//  HappyGrad
//
//  Created by David Okun on 5/18/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
  private let api = GithubAPI()
  private var subscriptions = Set<AnyCancellable>()
  @Published var allItems = [CongratsItem]()
  
  var items: [CongratsItem] {
    return self.allItems
  }
  
  @Published var error: GithubAPI.Error? = nil
  
  func fetchImageNames() {
    api
      .getImageNames()
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { completion in
        if case .failure(let error) = completion {
          self.error = error
        }
      }, receiveValue: { items in
        self.allItems = items
        self.error = nil
      })
      .store(in: &subscriptions)
  }
}
