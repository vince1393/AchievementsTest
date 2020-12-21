//
//  AsyncImage.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-21.
//

import SwiftUI

struct AsyncImage: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: URL?) {
        imageLoader = .init(url: url)
        imageLoader.load()
    }
    
    var body: some View {
        if (imageLoader.isLoading) {
            ProgressView()
        } else if let image = imageLoader.image {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(color: .gray, radius: 10, x: 5, y: 5)
        }
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(url: URL(string: "https://pbs.twimg.com/profile_images/1189547761231892481/tOpVcRYZ.jpg")!)
    }
}
