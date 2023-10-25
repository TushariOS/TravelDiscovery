//
//  Restaurants.swift
//  TravelDiscovery
//
//  Created by Tushar Jaunjalkar on 05/06/23.
//

import Foundation

struct Restaurants: Hashable {
    let name, imageName: String
}

struct ResturantDetails: Decodable {
    let description: String
    let popularDishes: [Dish]
    let thumbnail: String
    let photos: [String]
    let reviews: [Review]
}

struct Dish: Decodable, Hashable {    
    let name, price, photo: String
    let numPhotos: Int
}

struct Review: Decodable, Hashable {
    let rating: Int
    let text: String
    let user: ReviewUser
}

struct ReviewUser: Decodable, Hashable {
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
    let profileImage: String
}
//id: 0,
//username: "amyadams20",
//firstName: "Amy",
//lastName: "Adams",
//profileImage: "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a41cf22c-578d-456f-b0c4-90d5c017eab1",
//followers: 59384,
//following: 2112,
//rating: 4,
//text
