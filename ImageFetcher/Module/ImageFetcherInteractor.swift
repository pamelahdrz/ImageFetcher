//
//  ImageFetcherInteractor.swift
//  ImageFetcher
//
//  Created by Pamela Hernández on 07/06/24.
//

import Foundation

protocol ImageFetcherInteractor {
    func executeImagesFetcher() async -> [Images]
}
