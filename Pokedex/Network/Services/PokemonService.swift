//
//  PokemonService.swift
//  Pokedex
//
//  Created by SAUVAGE Maxime on 15/12/2021.
//

import Foundation
import Alamofire


protocol PokemonServiceProtocol {
    func getTypes() async throws -> [PokemonType] 
}

final class PokemonService: PokemonServiceProtocol {
    
    struct Constant {
        static let getTypesUrl = "https://pokeapi.co/api/v2/type"
    }
    
    func getTypes(completion: @escaping (PokemonTypeListResponse) -> Void) {
        AF.request(Constant.getTypesUrl).responseDecodable(of: PokemonTypeListResponse.self) { dataResponse in
            guard let value = dataResponse.value, dataResponse.error == nil else {
                debugPrint(dataResponse.error?.localizedDescription ?? "Error occurred while getting list type of pokemons")
                return
            }
            completion(value)
        }
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
}
