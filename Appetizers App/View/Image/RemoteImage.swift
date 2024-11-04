//
//  RemoteImage.swift
//  Appetizers App
//
//  Created by Nastya Klyashtorna on 2024-11-03.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    func load(fromUrl  urlString: String) {
        NetworkManagerAPI.shared.downloadImage(urlString: urlString) { uiImage in
            guard let image = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: image)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image? = nil
    var body: some View {
        image?.resizable() ?? Image("food").resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {imageLoader.load(fromUrl: urlString)}
    }
}
