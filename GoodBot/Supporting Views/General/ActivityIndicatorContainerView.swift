//
//  ActivityIndicatorContainerView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/4/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorContainerView<Content>: View where Content: View {
    private var childView: () -> Content
    var isLoading: Bool
    var blurRadius: Int
    
    init(isLoading: Bool = true, blurRadius: Int = 0, @ViewBuilder _ view: @escaping () -> Content) {
        self.isLoading = isLoading
        self.blurRadius = blurRadius
        self.childView = view
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            self.childView()
                .blur(radius: CGFloat(blurRadius))
            if isLoading {
                ActivityIndicatorView(isAnimating: .constant(true), style: .large)
            }
        }
    }
}

#if DEBUG
struct ActivityIndicatorContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorContainerView {
            VStack{Text("Loading")}
        }
    }
}
#endif
