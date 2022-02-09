//
//  PokemonDetailView.swift
//  PokedexSwiftUI
//
//  Created by SAUVAGE Maxime on 09/02/2022.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @ObservedObject var viewModel: PokemonDetailViewModel
    
    @State var scale: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            if let imageUrl = viewModel.detail?.imageUrl {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .onAppear {
                            scale = 1
                        }
                } placeholder: {
                    ProgressView("Loading...")
                }
                .frame(width: 200, height: 200)
                .scaleEffect(scale)
                .opacity(scale)
                .animation(.easeInOut(duration: 0.5), value: scale)
            } else {
                ProgressView("Loading...")
            }
            if let name = viewModel.detail?.name {
                Text(name)
                    .padding()
                    .font(.largeTitle.bold())
            } else {
                Text("Loading...")
                    .padding()
            }
            Spacer()
        }.onAppear {
            viewModel.getDetail()
            
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(viewModel: PokemonDetailViewModel(detailUrl: "https://pokeapi.co/api/v2/pokemon/1/", service: PokemonService()))
    }
}
