//
//  PokemonDetailResponse.swift
//  PokedexSwiftUI
//
//  Created by SAUVAGE Maxime on 09/02/2022.
//

import Foundation

struct PokemonDetailResponse: Decodable {
    let id: Int
    let name: String
    let order: Int
    let sprites: Sprite
}

struct Sprite: Decodable {
    let other: Other
}

struct Other: Decodable {
    let dreamWorld: DreamWorld
    let officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
    }
}

struct DreamWorld: Decodable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct OfficialArtwork: Decodable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
