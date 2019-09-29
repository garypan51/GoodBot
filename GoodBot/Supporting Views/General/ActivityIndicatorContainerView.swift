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
    
    init(@ViewBuilder _ view: @escaping () -> Content) {
        self.childView = view
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            self.childView()
//                .blur(radius: 6)
            ActivityIndicatorView(isAnimating: .constant(true), style: .large)
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
