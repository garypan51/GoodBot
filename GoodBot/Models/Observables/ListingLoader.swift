//
//  LisingLoader.swift
//  GoodBot
//
//  Created by Gary Pan on 8/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI
import Combine

class ListingLoader: ObservableObject {
    @Published var listings: [Listing] = []
    
    private var listingsUrl = ""
    private var cancellable: AnyCancellable? = nil
    
    private func loadListings(listingUrl: String) {
        print("Listing loader loadLostings ")

        guard let url = URL(string: self.listingsUrl) else { return }
        self.cancellable = HttpClient.shared.get(url: url, decodable: ListingResponse.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { listingResponse in
                DispatchQueue.main.async {
                    for listing in listingResponse.data.children {
                        self.listings.append(listing.data)
                    }
                }
            })
    }
    
    func loadInitialListings() {
        loadListings(listingUrl: self.listingsUrl)
    }
    
    func loadMoreListings() {
        // base url plus after param
//        loadListings(listingUrl: <#T##String#>)
    }
    
    init(listingsUrl: String) {
        self.listingsUrl = listingsUrl
        print("Listing loader init")
    }
}
