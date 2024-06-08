//
//  ImageFetcherInteractorImplementation.swift
//  ImageFetcher
//
//  Created by Pamela Hernández on 07/06/24.
//

import Foundation

class ImageFetcherInteractorImplementation: ImageFetcherInteractor {
    let gateway: ImageGateway
    
    init(gateway: ImageGateway = ImageGatewayImplementation()) {
        self.gateway = gateway
    }
    
    func executeImagesFetcher() async -> [Images] {
        var images: [Images] = []
            do {
                try await Task.sleep(for: .seconds(0.5))
                images = try await gateway.fetchImageResponse()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        return images
    }
}
