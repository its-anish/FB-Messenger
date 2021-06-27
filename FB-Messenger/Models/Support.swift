//
//  Support.swift
//  FB-Messenger
//
//  Created by Anish Manandhar on 26/06/2021.
//

import Foundation

struct Support: Codable {
    let url: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case url, text
    }
}
