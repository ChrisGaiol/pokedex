//
//  PokemonListResponse.swift
//  Pokedex
//
//  Created by SAUVAGE Maxime on 15/12/2021.
//

import Foundation

struct PokemonTypeListResponse: Decodable {
    
    var count: Int?
    var results: [PokemonType]?
    
    enum CodingKeys: String, CodingKey {
        case count
        case results
    }
    
}

struct PokemonType: Decodable {
    
    var name: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
}
