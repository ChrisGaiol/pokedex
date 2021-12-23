//
//  ViewController.swift
//  Pokedex
//
//  Created by Christian Gaiola on 25/11/2021.
//

import UIKit

class PokemonListViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: - Properties
    private var viewModel: PokemonListViewModelProtocol = PokemonListViewModel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        observeViewModel()
        
        viewModel.getPokemonTypes()
    }
    
    
    private func observeViewModel() {
        DispatchQueue.main.async {
            self.viewModel.pokemonTypeReloaded = {
                self.collectionView.reloadData()
            }
        }
        
    }
    
}

extension PokemonListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemonTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PokemonListCell else {
            return UICollectionViewCell()
        }
        let data = viewModel.pokemonTypes[indexPath.item]
        cell.setup(withTitle: data.name)
        return cell
    }
}

extension PokemonListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
