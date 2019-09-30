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
    
//    @ObservedObject var subredditsLoader: SubredditsLoader
    @ObservedObject var listingLoader: ListingLoader
    @State private var showSignInModal: Bool = false

    init() {
//        self.subredditsLoader = SubredditsLoader()
        self.listingLoader = ListingLoader(listingsUrl: "https://www.reddit.com/r/popular.json")
    }
    
    var body: some View {
        BackgroundView() {
        VStack {
//            SubredditListView(subreddits: self.subredditsLoader.subreddits)
            ListingListView(listings: self.listingLoader.listings)
//            NavigationLink(destination: ListingDetailView()) {
//                Text("Listing")
//            }
        }.padding(.top)
        }
        .onAppear(perform: {
            print("onAppear")

//            self.subredditsLoader.loadSubreddits()
            self.listingLoader.loadInitialListings()
        })
        .onDisappear(perform: {
            print("Disappear")
        })
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
