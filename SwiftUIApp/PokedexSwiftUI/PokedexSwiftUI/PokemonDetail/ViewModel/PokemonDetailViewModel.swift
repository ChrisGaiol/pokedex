//
//  PokemonDetailViewModel.swift
//  PokedexSwiftUI
//
//  Created by SAUVAGE Maxime on 09/02/2022.
//

import Foundation

final class PokemonDetailViewModel: ObservableObject {
    
    var detailUrl: String
    var service: PokemonServiceProtocol
    
    @Published var detail: PokemonDetail?
    @Published var imageData: Data?
    
    init(detailUrl: String, service: PokemonServiceProtocol) {
        self.detailUrl = detailUrl
        self.service = service
    }
    
    func getDetail() {
        DispatchQueue.main.async { [unowned self] in
            Task {
                self.detail = try? await service.getPokemonDetail(fromUrl: self.detailUrl)
                self.imageData = try? await service.getImage(fromUrl: self.detail?.imageUrl)
            }
        }
    }
    
}
