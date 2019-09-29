//
//  ListingDetailViewModel.swift
//  GoodBot
//
//  Created by Gary Pan on 8/11/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI
import Combine

class ListingDetailViewModel: ObservableObject {
    @Published var listing: Listing = nil
    
    private var listingsUrl = ""
    
    private func loadListings(listingUrl: String) {
        guard let url = URL(string: self.listingsUrl) else { return }
        var listingResponse: ListingResponse? = nil
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            do {
                listingResponse = try JSONDecoder().decode(ListingResponse.self, from: data)
            } catch let parseError {
                print("parsing error: \(parseError)")
            }
            
            DispatchQueue.main.async {
                for listing in listingResponse!.data.children {
//                    self.listings.append(listing.data)
                    print(listing.data.title)
                }
            }
            
//            print("Completed")
        }.resume()
    }
    
    func loadListing() {
        loadListings(listingUrl: self.listingsUrl)
    }
    
    init(listingsUrl: String) {
        self.listingsUrl = listingsUrl
//        self.loadListings(self.)
    }
}
