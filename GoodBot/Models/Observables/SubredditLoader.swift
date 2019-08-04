//
//  SubredditLoader.swift
//  GoodBot
//
//  Created by Gary Pan on 8/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI
import Combine

func getSubredditDataURL(subreddit: String) -> String{
    "https://www.reddit.com/r/\(subreddit)/about.json"
}

class SubredditsLoader: ObservableObject {
    @Published var subreddits: [Subreddit] = []
    
    let userSubreddits = [
        getSubredditDataURL(subreddit: "aww"),
        getSubredditDataURL(subreddit: "dogpictures"),
        getSubredditDataURL(subreddit: "puppysmiles"),
        getSubredditDataURL(subreddit: "pics"),
        getSubredditDataURL(subreddit: "mildlyinteresting"),
        getSubredditDataURL(subreddit: "zoomies"),
    ]
    
    func loadSubreddits() {
        for sub in userSubreddits {
            guard let url = URL(string: sub) else { return }
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else {return}
                var subreddit: [SubredditResponse] = []
                do {
                    subreddit = [try JSONDecoder().decode(SubredditResponse.self, from: data)]
                    
                } catch let parseError {
                    print("parsing error: \(parseError)")
                }
                
                DispatchQueue.main.async {
                    self.subreddits.append(subreddit[0].data)
                }
                
                print("Completed")
            }.resume()
        }
    }
    
    init() {
        loadSubreddits()
    }
}
