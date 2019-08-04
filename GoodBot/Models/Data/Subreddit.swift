//
//  Subreddit.swift
//  GoodBot
//
//  Created by Gary Pan on 8/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

struct Subreddit: Decodable {
    let name, icon_img, display_name, header_img, banner_background_image: String
}

struct SubredditResponse: Decodable {
    let kind: String
    let data: Subreddit
}
