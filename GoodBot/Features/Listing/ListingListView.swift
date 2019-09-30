//
//  ListingListView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ListingListView: View {
    let listings: [Listing]
    
    var body: some View {
        ScrollView {
            ForEach(self.listings, id: \.name) {
                ListingListItemView(listing: $0)
            }
            Text("Loading")
                .onAppear(perform: {print("Hi")})
        }
    }
}

//#if DEBUG
//struct ListingListView_Previews : PreviewProvider {
//    static var previews: some View {
//        ListingListView()
//    }
//}
//#endif
