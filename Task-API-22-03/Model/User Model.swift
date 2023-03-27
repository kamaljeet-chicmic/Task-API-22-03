//
//  User Model.swift
//  Task-API-22-03
//
//  Created by Paras  on 22/03/23.
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
