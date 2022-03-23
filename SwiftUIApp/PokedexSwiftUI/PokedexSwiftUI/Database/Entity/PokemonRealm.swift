//
//  PokemonRealm.swift
//  PokedexSwiftUI
//
//  Created by SAUVAGE Maxime on 23/03/2022.
//

import Foundation
import RealmSwift

class PokemonRealm: Object {
    dynamic var name: String = ""
    dynamic var order: Int = -1
    dynamic var types: List<String> = List<String>()
    dynamic var imageUrl: URL?
}
