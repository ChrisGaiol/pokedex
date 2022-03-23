//
//  PokemonListViewModel.swift
//  PokedexSwiftUI
//
//  Created by SAUVAGE Maxime on 09/02/2022.
//

import Foundation
import RealmSwift

final class PokemonListViewModel: ObservableObject {
    
    var pokemonService: PokemonServiceProtocol
    
    @Published var pokemons: [PokemonInfo] = []
    @Published var shouldPresent: Bool = false
    
    init(service: PokemonServiceProtocol) {
        pokemonService = service
    }
    
    func getPokemons() {
        Task {
            let pokemon = try? await pokemonService.getPokemons()
            DispatchQueue.main.async { [weak self] in
                self?.pokemons = pokemon ?? []
            }
        }
    }
    
}
