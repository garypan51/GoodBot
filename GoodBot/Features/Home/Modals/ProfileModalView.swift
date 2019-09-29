//
//  ProfileModalView.swift
//  GoodBot
//
//  Created by Gary Pan on 9/29/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ProfileModalView: View {
    @Binding var show: Bool
    @Binding var oauthCode: String?

    var closeButton: some View {
        HStack() {
            Button(action: {
                self.show.toggle()
            } ) {
                Text("close".localized())
            }.padding(.init(arrayLiteral: [.horizontal, .top]))
            Spacer()
        }
    }
    
    var body: some View {
        VStack {
            closeButton
            if self.oauthCode == nil {
                SignInView(oauthCode: $oauthCode)
            } else {
                ActivityIndicatorContainerView {
                    Text("Done")
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
