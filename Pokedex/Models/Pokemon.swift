//
//  Pokemon.swift
//  Pokedex
//
//  Created by Christian Gaiola on 25/11/2021.
//

import Foundation
import RealmSwift

struct Pokemon {
    
    let name: String
    let order: Int
    let types: Set<PokemonTypeEnum>
 
    init(name: String = "", order: Int = 0, types: Set<PokemonTypeEnum> = []) {
        self.name = name
        self.order = order
        self.types = types
    }
    
    func convert() -> PokemonRealm {
        let realm = PokemonRealm()
        realm.name = name
        realm.order = order
        realm.types = List<String>()
        types.forEach {
            realm.types.append($0.rawValue)
        }
        return realm
    }
}

struct PokemonDetail {
    let name: String
    let id: Int
    let order: Int
    let imageUrl: URL
}
