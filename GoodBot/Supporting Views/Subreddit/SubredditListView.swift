//
//  SubredditListView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct SubredditListView: View {
    let subreddit: Subreddit

    var body : some View {
        VStack {
            ImageLoaderView(imageUrl: subreddit.icon_img != "" ? subreddit.icon_img : subreddit.header_img)
            Text("r/\(subreddit.display_name)")
                .font(Font.system(size: 12, design: .default))
        }.onTapGesture {
//                self.onTap(self.subreddit.display_name)
        }
    }
}

struct SubredditList: View {
    let subreddits: [Subreddit]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("Hello")
                ForEach(self.subreddits, id: \.name) {
                    SubredditListView(subreddit: $0)
                }
            }
        }
    }
    func fake(s: String) {
        
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
