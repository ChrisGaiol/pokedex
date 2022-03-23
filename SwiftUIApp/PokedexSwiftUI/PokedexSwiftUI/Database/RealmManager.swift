//
//  RealmManager.swift
//  PokedexSwiftUI
//
//  Created by SAUVAGE Maxime on 23/03/2022.
//

import Foundation
import RealmSwift

class RealmManager {
    
    private var realm: Realm
    
    init() {
        realm = try! Realm()
        
    }
    
    func savePokemon(pokemon: PokemonRealm) {
        guard let obj = realm.objects(PokemonRealm.self).first { $0.name == pokemon.name } else {
            try! self.realm.write {
                self.realm.add(pokemon)
            }
            return
        }
        try! self.realm.write {
            obj.name = pokemon.name
        }
    }
    
}
