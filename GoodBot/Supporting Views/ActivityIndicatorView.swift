//
//  ActivityIndicatorView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/4/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
