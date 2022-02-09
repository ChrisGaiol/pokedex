//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Christian Gaiola on 25/11/2021.
//

import Foundation

protocol PokemonTypeListViewModelProtocol {
    var pokemonTypes: [PokemonType] { get }
    var pokemonTypeReloaded: (() -> Void)? { get set }
    func getPokemonTypes()
}

final class PokemonTypeListViewModel: PokemonTypeListViewModelProtocol {
    //MARK: - Attributes
    var service: PokemonServiceProtocol
    var pokemonTypes: [PokemonType] = [] {
        didSet {
            pokemonTypeReloaded?()
        }
    }
    var pokemonTypeReloaded: (() -> Void)?
    
    init(service: PokemonServiceProtocol = PokemonService()) {
        self.service = service
    }
    
    //MARK: - Methods
    func getPokemonTypes() {
        Task.init {
            pokemonTypes = try await service.getTypes()
        }
    }
    
}
