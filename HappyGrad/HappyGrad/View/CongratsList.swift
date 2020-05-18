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
  var items: [CongratsItem]
  
  @State private var isShowingVideo = false
  @State private var videoURLToShow: URL = GithubAPI.EndPoint.apiURL.absoluteURL
  
  var body: some View {
    List(self.items) { item in
      ListCell(cellItem: item)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .onTapGesture {
          self.videoURLToShow = item.videoURL
          self.isShowingVideo.toggle()
      }
    }.onAppear {
      UITableView.appearance().separatorStyle = .none
    }.sheet(isPresented: $isShowingVideo) {
      VideoPlayerView(videoURL: self.$videoURLToShow)
    }   .background(Color.gray)
  }
}

struct CongratsList_Previews: PreviewProvider {
  static var previews: some View {
    CongratsList(items: [CongratsItem(id: "krdhudfhg", name: "Morgan-Langlais"), CongratsItem(id: "dfiughudifhg", name: "Barnet-Levinson.jpg")])
  }
}
