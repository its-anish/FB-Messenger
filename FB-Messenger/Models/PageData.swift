//
//  PageData.swift
//  FB-Messenger
//
//  Created by Anish Manandhar on 26/06/2021.
//

import Foundation

struct PageData: Codable {
    let page, perPage, total, totalPages: Int
    let users: [User]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case users = "data"
        case support
    }
}
