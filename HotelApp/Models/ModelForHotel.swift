//
//  ModelForHotel.swift
//  HotelApp
//
//  Created by Vladimir on 25.12.2023.
//

import Foundation

struct Hotel: Codable {
    let id: Int
    let name: String
    let adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotel

    enum CodingKeys: String, CodingKey {
        case id, name, adress
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
}

struct AboutTheHotel: Codable {
    let description: String
    let peculiarities: [String]
}

enum LinkForHotel: String {
    case hotelApi = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
}
