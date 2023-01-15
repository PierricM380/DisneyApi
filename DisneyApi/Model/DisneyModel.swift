//
//  DisneyModel.swift
//  DisneyApi
//
//  Created by Pierric Marye on 05/01/2023.
//

import Foundation

import Foundation

struct DisneyModel: Codable {
    let data: [Data]
}

struct Data: Identifiable, Codable {
    let id: Int
    let name: String
    let imageURL: URL
    
    // enum should translate received datas to a conform readable properties (ex: id = "_id")
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case imageURL = "imageUrl"
    }
}
