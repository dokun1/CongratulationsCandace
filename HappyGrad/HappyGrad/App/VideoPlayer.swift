//
//  VideoPlayer.swift
//  HappyGrad
//
//  Created by David Okun on 5/18/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import SwiftUI
import AVFoundation
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
  @Binding var videoURL: URL
  
  private var player: AVPlayer {
    return AVPlayer(url: videoURL)
  }
  
  func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
    playerController.player = player
    playerController.player?.play()
  }
  
  func makeUIViewController(context: Context) -> AVPlayerViewController {
    return AVPlayerViewController()
  }
}
