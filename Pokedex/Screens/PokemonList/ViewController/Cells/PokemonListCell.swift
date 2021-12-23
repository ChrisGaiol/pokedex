//
//  PokemonListCell.swift
//  Pokedex
//
//  Created by SAUVAGE Maxime on 16/12/2021.
//

import UIKit

class PokemonListCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet weak var titleLbl: UILabel!
    
    //MARK: - Lifecycle
    func setup(withTitle title: String?) {
        titleLbl.text = title ?? ""
    }
    
}
