//
//  HomeView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/1/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sessionSettings: SessionSettings
    
    @ObservedObject var subredditsLoader = SubredditsLoader()
    @ObservedObject var listingLoader = ListingLoader(listingsUrl: "https://www.reddit.com/r/popular.json")
    
    var body: some View {
        List {
            SubredditList(subreddits: subredditsLoader.subreddits)
            ForEach(self.listingLoader.listings, id: \.name) {
                ListingListView(listing: $0)
            }
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
