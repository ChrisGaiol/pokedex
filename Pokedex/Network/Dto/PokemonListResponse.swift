//
//  PokemonListResponse.swift
//  Pokedex
//
//  Created by SAUVAGE Maxime on 26/01/2022.
//

import Foundation

struct PokemonListResponse: Decodable {
    
    var results: [PokemonInfo]?
    
}


struct PokemonInfo: Decodable, Hashable {
    
    var name: String
    var url: String
    
}
