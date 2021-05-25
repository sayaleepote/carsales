//
//  Car.swift
//  carsales
//
//  Created by Sayalee Pote on 25/05/21.
//

import Foundation

struct Car: Decodable {

    let id: String?
    let title: String?
    let location: String?
    let price: String?
    let mainPhoto: String?
    let detailsUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case title = "Title"
        case location = "Location"
        case price = "Price"
        case mainPhoto = "MainPhoto"
        case detailsUrl = "DetailsUrl"
    }
}
