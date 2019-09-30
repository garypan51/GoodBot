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
        BackgroundView {
            VStack(alignment: .leading) {
                Text(self.listing.title)
                .fixedSize(horizontal: false, vertical: true)
                Text("Upvotes: \(self.listing.ups)")
            }
            }.padding()
        .onTapGesture {
            self.showPop = true
        }
        .sheet(isPresented: $showPop) {
            ListingDetailView()
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
