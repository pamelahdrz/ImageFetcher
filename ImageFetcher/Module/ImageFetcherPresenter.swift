//
//  ImageFetcherPresenter.swift
//  ImageFetcher
//
//  Created by Pamela Hernández on 07/06/24.
//

import Foundation
import SwiftUI

final class ImageFetcherPresenter: ObservableObject {
    @Published var images: [Images] = []
    
    let interactor: ImageFetcherInteractor
    
    init(interactor: ImageFetcherInteractor = ImageFetcherInteractorImplementation()) {
        self.interactor = interactor
    }
    
    func getImages() async {
        Task { @MainActor in
            images = await interactor.executeImagesFetcher()
        }
    }
}
