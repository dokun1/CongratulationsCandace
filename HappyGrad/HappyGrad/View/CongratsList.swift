//
//  CongratsList.swift
//  HappyGrad
//
//  Created by David Okun on 5/16/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import SwiftUI
import AVFoundation
import AVKit

struct CongratsList: View {
  @State private var isShowingVideo = false
  @State private var videoURLToShow = VideoURLValidator.sampleURL
  @State var names: [String] = []
  var body: some View {
    List(names, id: \.self) { name in
      ListCell(imageName: name)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .onTapGesture {
          do {
            self.videoURLToShow = try VideoURLValidator.url(for: name)
            self.isShowingVideo.toggle()
          } catch let error {
            print("Error: \(error.localizedDescription)")
          }
      }
    }.onAppear {
      UITableView.appearance().separatorStyle = .none
    }.sheet(isPresented: $isShowingVideo) {
      VideoPlayerView(videoURL: self.$videoURLToShow)
    }   .background(Color.gray)
  }
  
  struct CongratsList_Previews: PreviewProvider {
    static var previews: some View {
      CongratsList(names: ["Tristan-Trevino", "Morgan-and-Tyler-Langlais", "Barnet-Levinson"])
    }
  }
}
