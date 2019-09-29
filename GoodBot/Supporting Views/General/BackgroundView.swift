//
//  BackgroundView.swift
//  GoodBot
//
//  Created by Gary Pan on 9/22/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI
    
struct BackgroundView<Content>: View where Content: View {
    private var backgroundColor: Color
    private var childView: () -> Content
    
    init(backgroundColor: Color, @ViewBuilder _ view: @escaping () -> Content) {
        self.backgroundColor = backgroundColor
        self.childView = view
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            self.childView()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(backgroundColor: Color.red) {
            Text("Hello")
        }
    }
}
