//
//  ListingListItemView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/5/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ListingListItemView : View {
    let listing: Listing
    
    @State var showPop = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(listing.title)
                .lineLimit(nil)
            Text("Upvotes: \(listing.ups)")
        }
        .onTapGesture {
            self.showPop = true
        }
        .sheet(isPresented: $showPop) {
            Text("Hello")
        }
    }
}

//#if DEBUG
//struct ListingListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListingListItemView()
//    }
//}
//#endif
