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
  @State private var videoURLToShow = URL(string: "https://github.com/dokun1/CongratulationsCandace/blob/master/docker/videos/IMG_3126%20-%20David%20Okun.MOV?raw=true")!
  @State var names: [String] = []
  var body: some View {
    List(names, id: \.self) { name in
      ListCell(imageName: name)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .onTapGesture {
          self.isShowingVideo.toggle()
      }
    }.onAppear {
      UITableView.appearance().separatorStyle = .none
    }.sheet(isPresented: $isShowingVideo) {
      VideoPlayerView(videoURL: self.$videoURLToShow)
    }
  }
  
  struct CongratsList_Previews: PreviewProvider {
    static var previews: some View {
      CongratsList(names: ["barnet", "david", "tristan", "david", "tristan", "barnet"])
    }
  }
}
