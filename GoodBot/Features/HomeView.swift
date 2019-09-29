//
//  HomeView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/1/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI
import UserNotifications


struct HomeView: View {
    @EnvironmentObject var sessionSettings: SessionSettings
    
//    @ObservedObject var profileLoader = ProfileLoader()
    @ObservedObject var subredditsLoader = SubredditsLoader()
    @ObservedObject var listingLoader = ListingLoader(listingsUrl: "https://www.reddit.com/r/popular.json")
    
    @State private var showSignInModal: Bool = false

//    
//    private func signIn() {
//        self.
//    }
    var body: some View {
//        List {
//            SubredditListView(subreddits: self.subredditsLoader.subreddits)
//            ListingListView(listings: self.listingLoader.listings)
//            NavigationLink(destination: ListingDetailView()) {
//                Text("Listing")
//            }
//        }
//        .onAppear(perform: {
//            print("onAppear")
//
//            self.subredditsLoader.loadSubreddits()
//            self.listingLoader.loadInitialListings()
//        })
//        .onDisappear() {
//
//        }
        BackgroundView(backgroundColor: Color("backgroundColor")) {
            VStack {
                Button(action: {
                    self.showSignInModal = true
                }) {
                    Text("sign_in".localized())
                }
                
            }.padding(.top)
        }.sheet(isPresented: self.$showSignInModal) {
            ProfileModalView(show: self.$showSignInModal, oauthCode: self.$sessionSettings.oauthCode)
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
