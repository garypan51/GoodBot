//
//  Listing.swift
//  GoodBot
//
//  Created by Gary Pan on 8/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

struct Listing: Decodable {
    let name, title, id: String
    let ups: Int
}

struct ListingData: Decodable {
    let kind: String
    let data: Listing
}

struct ListingResponseData: Decodable {
    let after, before: String?
    let children: [ListingData]
}

struct ListingResponse: Decodable {
    let kind: String
    let data: ListingResponseData
}
