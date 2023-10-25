//
//  Attraction.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 13/06/23.
//

import Foundation
 
/// Attraction
struct Attraction: Identifiable {
    let id = UUID().uuidString
    let name: String
    let lattitude: Double
    let longitude: Double
    let image: String
}
