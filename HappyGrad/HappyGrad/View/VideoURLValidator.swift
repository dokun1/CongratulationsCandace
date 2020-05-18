//
//  VideoURLValidator.swift
//  HappyGrad
//
//  Created by David Okun on 5/18/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import Foundation

enum VideoError: Error {
  case badURL
}

class VideoURLValidator {
  static func url(for person: String) throws -> URL {
    guard let url = URL(string: "https://github.com/dokun1/CongratulationsCandace/blob/master/docker/videos/\(person).mov?raw=true") else {
      throw VideoError.badURL
    }
    return url
  }
  
  static var sampleURL: URL {
    URL(string: "https://github.com/dokun1/CongratulationsCandace/blob/master/docker/videos/Tristan-Trevino.mov?raw=true")!
  }
}
