//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Christian Gaiola on 25/11/2021.
//

import Foundation

protocol PokemonListViewModelProtocol {
    var pokemonList: [PokemonInfo] { get }
    var pokemonListReloaded: (() -> Void)? { get set }
    func getPokemonList()
}

final class PokemonListViewModel: PokemonListViewModelProtocol {
    //MARK: - Attributes
    var service: PokemonServiceProtocol
    private(set) var pokemonList: [PokemonInfo] = [] {
        didSet {
            pokemonListReloaded?()
        }
    }
    var pokemonListReloaded: (() -> Void)?
    
    init(service: PokemonServiceProtocol = PokemonService()) {
        self.service = service
    }
    
    //MARK: - Methods
    func getPokemonList() {
        Task.init {
            pokemonList = try await service.getPokemons()
        }
    }
    
}
