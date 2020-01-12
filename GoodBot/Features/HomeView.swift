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
    @ObservedObject var listingLoader: ListingLoader
    @State private var showSignInModal: Bool = false

    init() {
        self.listingLoader = ListingLoader(listingsUrl: "https://www.reddit.com/r/popular.json")
    }
    
    var body: some View {
        BackgroundView() {
        VStack {
            ListingListView(listings: self.listingLoader.listings)
        }.padding(.top)
        }
        .onAppear(perform: {
            if let token = UserRepository.shared.loadAccessToken() {
                print(token.dateCreated)
            }
            self.listingLoader.loadInitialListings()
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
