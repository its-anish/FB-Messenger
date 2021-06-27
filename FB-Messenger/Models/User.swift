//
//  User.swift
//  FB-Messenger
//
//  Created by Anish Manandhar on 26/06/2021.
//

import Foundation

struct User: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
    
}
