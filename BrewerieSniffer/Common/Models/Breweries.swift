//
//  Breweries.swift
//  BrewerieSniffer
//
//  Created by Martin Lukacs on 18/03/2021.
//

import SwiftUI
import Networking

// MARK: - Brewery
struct Brewery: Codable, Identifiable {
    let id: Int
    let breweryType: BreweryType
    let name: String
    let street: String
    let city, state: String
    let postalCode: String
    let country: String
    let longitude, latitude: String?
    let phone: String
    let websiteURL: String
    let updatedAt, createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case breweryType = "brewery_type"
        case street
        case city, state
        case postalCode = "postal_code"
        case country, longitude, latitude, phone
        case websiteURL = "website_url"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
    }
}
extension Brewery: NetworkingJSONDecodable {}

enum BreweryType: String, Codable, CaseIterable {
    case none = "All"
    case micro
    case nano
    case regional
    case brewpub
    case large
    case planning
    case bar
    case contract
    case proprietor
    case closed
}
extension BreweryType: NetworkingJSONDecodable {}
