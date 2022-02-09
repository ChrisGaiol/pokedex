//
//  PokemonListView.swift
//  Pokedex-SwiftUI
//
//  Created by SAUVAGE Maxime on 09/02/2022.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject var viewModel = PokemonListViewModel(service: PokemonService())
    
    var rows: [GridItem] =
            Array(repeating: .init(.fixed(20)), count: 1)
    
    var body: some View {
        VStack {
            NavigationView {
        
                List {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows, alignment: .center, spacing: 30) {
                            ForEach((0...79), id: \.self) { index in
                                VStack {
                                    Spacer()
                                    Image(systemName: "pawprint")
                                    Text("Pokemon")
                                        .padding()
                                    Spacer()
                                }
                            }
                        }
                    }
                    
                    ForEach(viewModel.pokemons, id: \.self) { pokemon in
                        NavigationLink<Text, PokemonDetailView> {
                            PokemonDetailView(viewModel: PokemonDetailViewModel(detailUrl: pokemon.url, service: PokemonService()))
                        } label: {
                            Text(pokemon.name)
                        }
                    }
                }.onAppear {
                    viewModel.getPokemons()
                }.navigationTitle("Pokemons")
                
                
                
            }
            
            /*Button("button") {
                viewModel.shouldPresent = true
            }.sheet(isPresented: $viewModel.shouldPresent) {
                PokemonDetailView()
            }*/
        }
        
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
