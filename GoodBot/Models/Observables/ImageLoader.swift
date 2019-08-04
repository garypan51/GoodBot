//
//  ImageLoader.swift
//  GoodBot
//
//  Created by Gary Pan on 8/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class ImageLoader: ObservableObject {
    var willChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        willSet {
            willChange.send(data)
        }
    }
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {return}
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
