//
//  ProfileModalView.swift
//  GoodBot
//
//  Created by Gary Pan on 9/29/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ProfileModalView: View {
    @EnvironmentObject var sessionSettings: SessionSettings

    var body: some View {
        GeometryReader { geometry in
            BackgroundView(backgroundColor: Color("backgroundColor")) {
                VStack {
                    if self.sessionSettings.oauthCode == nil {
                        SignInView(oauthCode: self.$sessionSettings.oauthCode)
                    } else {
                        ActivityIndicatorContainerView {
                            ProfileView(oauthCode: self.$sessionSettings.oauthCode)
                        }.frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
            }
        }
    }
}

//struct ProfileModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileModalView()
//    }
//}
