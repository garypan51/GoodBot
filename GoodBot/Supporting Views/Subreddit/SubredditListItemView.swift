//
//  SubredditListItemView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/5/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct SubredditListItemView: View {
    let subreddit: Subreddit
    @EnvironmentObject var sessionSettings: SessionSettings

    var body : some View {
        VStack {
            ImageLoaderView(imageUrl: subreddit.icon_img != "" ? subreddit.icon_img : subreddit.header_img)
            Text("r/\(subreddit.display_name)")
                .font(Font.system(size: 12, design: .default))
        }.onTapGesture {
            self.sessionSettings.changeNavigationTitle(title: self.subreddit.display_name)
        }
    }
}

//#if DEBUG
//struct SubredditListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubredditListItemView()
//    }
//}
//#endif
