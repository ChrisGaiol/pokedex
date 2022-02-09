//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by SAUVAGE Maxime on 26/01/2022.
//

import Foundation
import UIKit

class PokemonListViewController: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    //MARK:- Attributes
    private var viewModel: PokemonListViewModelProtocol!
    
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PokemonListViewModel()
        
        viewModel.pokemonListReloaded = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    //MARK:- Methods
    private func getPokemonList() {
        viewModel.getPokemonList()
    }
}

extension PokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PokemonInfoCell else {
            return UITableViewCell()
        }
        cell.setTitle(title: "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
