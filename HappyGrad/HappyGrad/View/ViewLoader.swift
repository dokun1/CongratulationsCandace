  ////
  ////  ViewLoader.swift
  ////  HappyGrad
  ////
  ////  Created by David Okun on 5/16/20.
  ////  Copyright © 2020 David Okun. All rights reserved.
  ////
  //
  //import Foundation
  //import SwiftUI
  //import Combine
  //
  //enum LoaderError {
  //  case badURL
  //  case badImage
  //}
  //
  //public class ViewLoader: ObservableObject {
  //  
  //  @Published var data = Data()
  //  let url:String
  //  
  //  public init(url:String){
  //    self.url = url
  //  }
  //  
  //  public static func loadImage(from url: String) -> AnyPublisher<Image, URLError> {
  //    
  //  }
  //  public func loadData() {
  //    guard let url = URL(string:url) else {
  //      return
  //    }
  //    
  //    URLSession.shared.dataTask(with: url){(data,_,_) in
  //      guard let data = data else {return}
  //      DispatchQueue.main.async {
  //        self.data = data
  //      }
  //    }.resume()
  //  }
  //  
  //  public func getData() -> Data {
  //    return data
  //  }
  //  
  //  public func getUrl() -> String {
  //    return url
  //  }
  //}
