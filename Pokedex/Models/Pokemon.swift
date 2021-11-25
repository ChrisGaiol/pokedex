//
//  Pokemon.swift
//  Pokedex
//
//  Created by Christian Gaiola on 25/11/2021.
//

import Foundation

struct Pokemon {
    
    let name: String
    let order: Int
    let types: Set<PokemonType>
 
    init(name: String = "", order: Int = 0, types: Set<PokemonType> = []) {
        self.name = name
        self.order = order
        self.types = types
    }
}
