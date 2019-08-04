//
//  ListingListView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ListingListView : View {
    let listing: Listing
    
    @State var showPop = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(listing.title)
            .lineLimit(4)
            Text("Upvotes: \(listing.ups)")
        }
        .onTapGesture {
            self.showPop = true
        }
        .sheet(isPresented: $showPop) {
            VStack {
                Text("Hello")
            }
        }
    }
    
//    private var popView: Popover? {
//        let pop = Popover(content: Text("Hello")){
//            self.showPop = false
//        }
//        return self.showPop ? pop:nil
//    }
}

//#if DEBUG
//struct ListingListView_Previews : PreviewProvider {
//    static var previews: some View {
//        ListingListView()
//    }
//}
//#endif
