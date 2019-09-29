//
//  SubredditListView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct SubredditListView: View {
    var subreddits: [Subreddit]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                NavigationLink(destination: ListingDetailView()) {
                    Text("See\nAll")
                }
                ForEach(self.subreddits, id: \.name) {
                    SubredditListItemView(subreddit: $0)
                }
            }
        }
    }
}

//#if DEBUG
//struct SubredditListView_Previews : PreviewProvider {
//    let previewSubreddit = Subreddit()
//
//    static var previews: some View {
//        SubredditListView(previewSubreddit)
//    }
//}
//#endif
