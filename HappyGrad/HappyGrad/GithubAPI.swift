//
//  GithubAPI.swift
//  HappyGrad
//
//  Created by David Okun on 5/18/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import Foundation
import Combine

class GithubAPI {
  private let session = URLSession(configuration: .default)
  private let apiQueue = DispatchQueue(label: "API", qos: .default, attributes: .concurrent)
  private let decoder = JSONDecoder()
  
  enum Error: LocalizedError, Identifiable {
    var id: String { localizedDescription }
    
    case addressUnreachable(URL)
    case invalidResponse
    
    var errorDescription: String? {
      switch self {
        case .invalidResponse: return "The server responded with garbage."
        case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
      }
    }
  }
  
  enum EndPoint {
    static let baseURL = URL(string: "https://github.com/dokun1/CongratulationsCandace/raw/master/docker")!
    static let apiURL = URL(string: "https://api.github.com/repositories/264522176/contents/docker/images")!
    
    case images
    case image(String)
    case video(String)
    
    var url: URL {
      switch self {
        case .images:
          return EndPoint.apiURL
        case .image(let id):
          return EndPoint.baseURL.appendingPathComponent("/images/\(id).jpg")
        case .video(let id):
          return EndPoint.baseURL.appendingPathComponent("/videos/\(id).mov")
      }
    }
  }
  
  func getImageNames() -> AnyPublisher<[CongratsItem], Error> {
    session.dataTaskPublisher(for: EndPoint.images.url)
      .receive(on: apiQueue)
      .map { $0.data }
      .decode(type: [CongratsItem].self, decoder: decoder)
      .mapError { error in
        switch error {
          case is URLError:
            return Error.addressUnreachable(EndPoint.images.url)
          default:
            return Error.invalidResponse
        }
      }
      .map { items in
        return items.sorted { $0.name < $1.name }
      }
      .eraseToAnyPublisher()
  }
}
