//
//  ModelForHotelRoom.swift
//  HotelApp
//
//  Created by Vladimir on 25.12.2023.
//

import Foundation

struct HotelRooms: Codable {
    let rooms: [Room]
}

struct Room: Codable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}

enum LinkForRooms: String {
    case roomApi = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
}
