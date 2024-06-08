//
//  Images.swift
//  ImageFetcher
//
//  Created by Pamela Hernández on 07/06/24.
//

import Foundation

struct Images: Decodable {
    var albumId: String?
    var id: String?
    var title: Int?
    var url: String?
    var thumbnailUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case albumId
        case id
        case title
        case url
        case thumbnailUrl
    }
}

extension Images {
    var imageURL: URL? {
        guard let url = thumbnailUrl else { return nil }
        return URL(string: url)
    }
}
