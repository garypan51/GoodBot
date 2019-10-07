//
//  ProfileView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/1/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @Binding var oauthCode: String?
    
    var body: some View {
            
        // else show profile
        ScrollView {
            Text("Name")
            Text("UserName")
            Text("Karma")
        }.onAppear(perform: {
            
            let username = SecretConstants.redditClientId
            let password = ""
            let loginString = String(format: "%@:%@", username, password)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            
            let session = URLSession.shared
            let url = URL(string: "https://www.reddit.com/api/v1/access_token")!
            let postData = NSMutableData(data: "grant_type=authorization_code&code=\(self.oauthCode!)&redirect_uri=goodbot%3A%2F%2Fauth".data(using: String.Encoding.utf8)!)

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpBody = postData as Data
           
            var accessToken: AccessToken? = nil

            let task = session.dataTask(with: request) { data, response, error in
                guard let data = data else {return}
                            do {
                                let decoder = JSONDecoder()
                                decoder.keyDecodingStrategy = .convertFromSnakeCase
                                accessToken = try decoder.decode(AccessToken.self, from: data)
                                print(accessToken!.accessToken)
                                UserRepository.shared.saveAccessToken(accessToken: accessToken!)
                            } catch let parseError {
                                print("parsing error: \(parseError)")
                            }
                            
//                            DispatchQueue.main.async {
//                                for listing in listingResponse!.data.children {
//                                    self.listings.append(listing.data)
//                //                    print(listing.data.title)
//                                }
//                            }
//                if let data = data, let dataString = String(data: data, encoding: .utf8) {
//                    print(data["access_token"])
//               }
           }

           task.resume()
        })
    }
}

//#if DEBUG
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
//#endif
