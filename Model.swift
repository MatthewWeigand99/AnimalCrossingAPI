//
//  Model.swift
//  AnimalCrossingAPI
//
//  Created by Matthew Weigand on 10/12/22.
//

import Foundation

struct VillagerModel: Decodable {
    var id: Int
    var species: String
    var personality: String
    var birthday_string: String
    var icon_uri: String
    //var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case species
        case personality
        case icon_uri
        case birthday_string = "birthday-string"
        //case name = "name-USen"
    }
}

struct BugModel: Decodable {
    var id: Int
    var icon_uri: String
    var price: Int
    var price_flick: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case icon_uri
        case price
        case price_flick = "price-flick"
    }
}

struct FishModel: Decodable {
    var id: Int
    var name: String
    var icon_uri: String
    var price: Int
    var price_cj: Int
  
    enum CodingKeys: String, CodingKey {
        case id
        case name = "file-name"
        case icon_uri
        case price
        case price_cj = "price-cj"
    }
}
