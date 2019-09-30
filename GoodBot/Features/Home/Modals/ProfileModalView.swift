//
//  ProfileModalView.swift
//  GoodBot
//
//  Created by Gary Pan on 9/29/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ProfileModalView: View {
    @Binding var oauthCode: String?
    
    var body: some View {
        BackgroundView(backgroundColor: Color("backgroundColor")) {
            VStack {
                if self.oauthCode == nil {
                    SignInView(oauthCode: self.$oauthCode)
                } else {
                    ActivityIndicatorContainerView {
                        Text("Done")
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
