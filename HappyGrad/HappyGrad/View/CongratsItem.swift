//
//  CongratsItem.swift
//  HappyGrad
//
//  Created by David Okun on 5/18/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import Foundation

struct CongratsItem: Codable, Identifiable {
  enum CodingKeys: String, CodingKey {
    case id = "sha"
    case name = "name"
  }
  
  var id: String
  var name: String
  var codedName: String {
    String(self.name.split(separator: ".").first ?? "")
  }
  var displayName: String {
    String(self.name.replacingOccurrences(of: "-", with: " ").split(separator: ".").first ?? "")
  }
  var imageURL: URL {
    GithubAPI.EndPoint.image(self.codedName).url
  }
  var videoURL: URL {
    GithubAPI.EndPoint.video(self.codedName).url
  }
}
