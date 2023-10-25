//
//  Place.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 08/06/23.
//

import Foundation

struct Place: Decodable, Hashable {
    let name: String
    let thumbnail: String
    let id: Int
}
