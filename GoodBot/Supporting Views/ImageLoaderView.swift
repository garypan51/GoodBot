//
//  ImageLoaderView.swift
//  GoodBot
//
//  Created by Gary Pan on 8/3/19.
//  Copyright © 2019 Gary Pan. All rights reserved.
//

import SwiftUI

struct ImageLoaderView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(imageUrl: String) {
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    var body: some View {
        Image(uiImage: (imageLoader.data.count == 0) ? UIImage(named: "apple")! : UIImage(data: imageLoader.data)!)
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .frame(width: 80, height: 90)
    }
}

#if DEBUG
struct ImageLoaderView_Previews : PreviewProvider {
    static let imageUrl = "https://b.thumbs.redditmedia.com/aKWBgkEo7FnZ1d598QhzMrSZ-J1mVCk2H4kxOiikL8A.png"
    
    static var previews: some View {
        ImageLoaderView(imageUrl: imageUrl)
    }
}
#endif
