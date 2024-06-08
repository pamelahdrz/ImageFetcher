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
        await withCheckedContinuation { continuation in
            gateway.fetchImageResponse { (response) in
                switch response.result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
