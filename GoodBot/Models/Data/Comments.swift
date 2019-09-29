//
//  Comments.swift
//  GoodBot
//
//  Created by Gary Pan on 8/11/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

struct Comment: Decodable {
    let name, title: String
    let ups: Int
}


struct CommentData: Decodable {
    let kind: String
    let data: Comment
}

struct CommentResponseData: Decodable {
    let after, before: String?
    let children: [CommentData]
}

struct CommentResponse: Decodable {
    let kind: String
    let data: ListingResponseData
}
