//
//  ImageGateway.swift
//  ImageFetcher
//
//  Created by Pamela Hernández on 07/06/24.
//

import Foundation
import Alamofire

protocol ImageGateway {
    func fetchImageResponse(completionHandler: @escaping (AFDataResponse<[Images]>) -> ())
}
