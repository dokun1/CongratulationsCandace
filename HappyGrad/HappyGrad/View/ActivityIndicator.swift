//
//  ActivityIndicator.swift
//  HappyGrad
//
//  Created by David Okun on 5/16/20.
//  Copyright © 2020 David Okun. All rights reserved.
//

import Foundation
import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
  
  let style: UIActivityIndicatorView.Style
  
  public func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
    return UIActivityIndicatorView(style: style)
  }
  
  public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
    uiView.startAnimating()
  }
}
