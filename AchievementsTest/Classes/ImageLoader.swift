//
//  ImageLoader.swift
//  AchievementsTest
//
//  Created by Vince on 2020-12-21.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var url: URL?
    @Published var image: Image?
    @Published var isLoading: Bool = false
    
    init(url: URL?) {
        self.url = url
    }
    
    #warning("TODO - Add image caching")
    func load() {
        guard let url = url else {
            print("url is nil - \(#file) - \(#line)")
            return
        }
        
        isLoading = true
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading Image - \(#file) - \(#line) - \(error)")
                self.loadingCompletion(uiImage: UIImage(systemName: "exclamationmark.square.fill")!)
                return
            }
            
            guard let imageData = data else {
                print("No image data returned - \(#file) - \(#line)")
                self.loadingCompletion(uiImage: UIImage(systemName: "exclamationmark.square.fill")!)
                return
            }
            
            guard let uiImage = UIImage(data: imageData) else {
                print("Data could not be used to create UIImage - \(#file) - \(#line)")
                self.loadingCompletion(uiImage: UIImage(systemName: "exclamationmark.square.fill")!)
                return
            }
            
            self.loadingCompletion(uiImage: uiImage)
        }.resume()
    }
    
    func loadingCompletion(uiImage: UIImage) {
        DispatchQueue.main.async {
            self.image = Image(uiImage: uiImage)
            self.isLoading = false
        }
    }
}
