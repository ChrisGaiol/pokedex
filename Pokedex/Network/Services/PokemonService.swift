//
//  PokemonService.swift
//  Pokedex
//
//  Created by SAUVAGE Maxime on 15/12/2021.
//

import Foundation


protocol PokemonServiceProtocol {
    func getTypes() async throws -> [PokemonType]
    func getPokemons() async throws -> [PokemonInfo]
    func getPokemonDetail(fromUrl urlString: String) async throws -> PokemonDetail?
    func getImage(fromUrl url: URL?) async throws -> Data?
}

final class PokemonService: PokemonServiceProtocol {
    
    struct Constant {
        static let getTypesUrl = "https://pokeapi.co/api/v2/type"
        static let getPokemonsUrl = "https://pokeapi.co/api/v2/pokemon?limit=151"
    }
    
    func getTypes() async throws -> [PokemonType] {
        guard let url = URL(string: Constant.getTypesUrl) else {
            return []
        }
    
        let (data, _) = try await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        guard let response = try? jsonDecoder.decode(PokemonTypeListResponse.self, from: data), let list = response.results else {
            return []
        }
        return list
    }
    
    func getPokemons() async throws -> [PokemonInfo] {
        guard let url = URL(string: Constant.getPokemonsUrl) else {
            return []
        }
    
        let (data, _) = try await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        guard let response = try? jsonDecoder.decode(PokemonListResponse.self, from: data), let list = response.results else {
            return []
        }
        return list
    }
    
    func getPokemonDetail(fromUrl urlString: String) async throws -> PokemonDetail? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        guard let response = try? jsonDecoder.decode(PokemonDetailResponse.self, from: data) else {
            return nil
        }
        return PokemonDetail(name: response.name, id: response.id, order: response.order, imageUrl: URL(string: response.sprites.other.officialArtwork.frontDefault)!)
    }
    
    func getImage(fromUrl url: URL?) async throws -> Data? {
        guard let u = url else {
            return nil
        }
        let (data, _) = try await URLSession.shared.data(from: u)
        return data
    }
}
