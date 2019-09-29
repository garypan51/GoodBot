//
//  SignInView.swift
//  GoodBot
//
//  Created by Gary Pan on 9/22/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @Binding var oauthCode: String?

    let redditOauthURL = "https://www.reddit.com/api/v1/authorize.compact?client_id=\(SecretConstants.redditClientId)&response_type=code&state=\(SecretConstants.state)&redirect_uri=goodbot://auth&duration=permanent&scope=identity"
    
    var body: some View {
        WebView(request: URLRequest(url: URL(string: redditOauthURL)!))
    }
}

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView(false)
//    }
//}
