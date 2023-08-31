//
//  WebImage.swift
//  SeSAC3PhotoGram
//
//  Created by 서승우 on 2023/08/31.
//

import Foundation

// MARK: - Welcome
struct WebImageContainer: Decodable {
    let total, totalPages: Int
    let results: [WebImage]

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct WebImage: Decodable {
    let urls: Urls
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
