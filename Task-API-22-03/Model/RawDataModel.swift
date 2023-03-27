//
//  RawDataModel.swift
//  Task-API-22-03
//
//  Created by Paras  on 22/03/23.
//

import Foundation
import SwiftUI


struct RawData: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}


// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}

//let text: String
